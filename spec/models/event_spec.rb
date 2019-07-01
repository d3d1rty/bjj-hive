# frozen_string_literal: true

require 'rails_helper'

describe Event, type: :model do
  let(:organizer) { create(:user, :is_organizer) }
  let!(:location) { organizer.locations.create(attributes_for(:location)) }

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_length_of :name }
    it { should validate_presence_of :summary }
    it { should validate_length_of :summary }
    it { should belong_to :user }

    it 'prevent event start occurring after end date on different days' do
      expect(
        build(:event, start_date: Time.now, end_date: 1.day.ago, user: organizer, location: location)
      ).to_not be_valid
    end

    it 'allow event start and end date on same day' do
      expect(
        build(:event, start_date: Time.now, end_date: Time.now, user: organizer, location: location)
      ).to be_valid
    end

    it 'allow event start occurring before event end' do
      expect(
        build(:event, start_date: 1.day.ago, end_date: Time.now, user: organizer, location: location)
      ).to be_valid
    end
  end
end
