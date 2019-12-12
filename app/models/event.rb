# frozen_string_literal: true

##
# = Event
# Author::    Richard Davis
#
# This model handles data and methods for event objects.
class Event < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  belongs_to :location
  has_many :favorite_events
  has_many :favorited_by, through: :favorite_events, source: :user
  has_many :comments

  validates :name, presence: true, length: { maximum: 50 }
  validates :summary, presence: true, length: { maximum: 1000 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :time_zone, presence: true
  validate :category_must_be_permitted, :start_must_come_before_end

  scope :not_past, -> { where('start_date > ?', 1.day.ago) }

  has_rich_text :summary
  friendly_id :slug_candidates, use: :slugged
  reverse_geocoded_by 'locations.latitude', 'locations.longitude'

  def start_date
    return nil if self[:start_date].blank?

    Time.use_zone(self[:time_zone]) { self[:start_date] }.strftime('%b %e, %Y %l:%M %p')
  end

  def end_date
    return nil if self[:end_date].blank?

    Time.use_zone(self[:time_zone]) { self[:end_date] }.strftime('%b %e, %Y %l:%M %p')
  end

  ##
  # Provides search query for event model
  def self.search(query)
    Event.joins(:location).near(query, 50)
  end

  ##
  # Preferred time zones
  def self.preferred_time_zones
    [
      ActiveSupport::TimeZone['Eastern Time (US & Canada)'],
      ActiveSupport::TimeZone['Central Time (US & Canada)'],
      ActiveSupport::TimeZone['Mountain Time (US & Canada)'],
      ActiveSupport::TimeZone['Pacific Time (US & Canada)'],
      ActiveSupport::TimeZone['Hawaii'],
      ActiveSupport::TimeZone['Alaska']
    ]
  end

  ##
  # Permitted event category values.
  def self.permitted_categories
    %w[Class Conference Seminar Tournament]
  end

  ##
  # Slug name fallbacks for uniqueness.
  def slug_candidates
    [
      :name,
      %i[name city],
      %i[name city start_date]
    ]
  end

  ##
  # City of the event location for use in slugs.
  def city
    location&.city
  end

  ##
  # Validation for categories
  def category_must_be_permitted
    errors.add(:category, I18n.t('models.event.validations.unpermitted_category')) unless Event.permitted_categories.include?(category)
  end

  ##
  # Validation for start/end date.
  def start_must_come_before_end
    errors.add(:start_date, I18n.t('models.event.validations.start_before_end')) if date_field_present? && self[:start_date] > self[:end_date]
  end

  ##
  # Checks if any of the date fields have been provided.
  def date_field_present?
    start_date.present? && end_date.present?
  end
end
