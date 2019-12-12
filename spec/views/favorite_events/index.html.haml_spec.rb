# frozen_string_literal: true

require 'rails_helper'

describe 'favorite_events/index', type: :view do
  let(:favorite_events) { [create(:event), create(:event), create(:event)] }

  before do
    @favorite_events = Kaminari.paginate_array(favorite_events).page(1)
    render
  end

  it 'renders the event partials' do
    @favorite_events.each do |event|
      expect(rendered).to have_content(event.name.to_s)
      expect(rendered).to have_content(event.fee.to_s)
      expect(rendered).to have_content(format_date_and_zone(event.start_date, event.time_zone))
      expect(rendered).to have_content(format_date_and_zone(event.end_date, event.time_zone))
    end
  end
end
