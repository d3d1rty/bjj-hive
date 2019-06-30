# frozen_string_literal: true

##
# = ApplicationHelper
# Author::    Richard Davis
#
# This helper module provides methods for use across application views.
module ApplicationHelper
  ##
  # = MarkdownPreprocessor
  # Author::    Richard Davis
  #
  # This class overrides the default redcarpet processor.
  class MarkdownPreprocessor < Redcarpet::Render::HTML
    def block_code(*)
      nil
    end
  end

  def markdown(content)
    preprocessor = MarkdownPreprocessor.new(filter_html: true, no_images: false, no_styles: true, hard_wrap: false)
    @markdown ||= Redcarpet::Markdown.new(preprocessor, autolink: true,
                                                        footnotes: false,
                                                        space_after_headers: true,
                                                        fenced_code_blocks: false,
                                                        underline: true,
                                                        highlight: true,
                                                        tables: true)
    @markdown.render(content).html_safe
  end

  def format_date(date)
    date.strftime('%B %e, %Y')
  end

  def format_time(time, time_zone)
    time.in_time_zone(time_zone).strftime('%I:%M %p (%Z)')
  end

  def hours_for_form
    (1..12).map { |v| v.to_s.rjust(2, '0') }
  end

  def minutes_for_form
    [0, 15, 30, 45].map { |v| v.to_s.rjust(2, '0') }
  end

  def hour_from_time(time)
    if time.strftime('%H').to_i.zero?
      '12'
    elsif time.strftime('%H').to_i > 12
      (time.strftime('%H').to_i - 12).to_s.rjust(2, '0')
    else
      time.strftime('%H')
    end
  end

  def minute_from_time(time)
    time.strftime('%M')
  end

  def period_from_time(time)
    time.strftime('%H').to_i >= 12 ? 'pm' : 'am'
  end

  def format_currency(money)
    "$#{number_with_precision(money, precision: 2)}"
  end
end
