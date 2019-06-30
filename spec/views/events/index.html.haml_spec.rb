# frozen_string_literal: true

require 'rails_helper'

describe 'events/index', type: :view do
  let(:events) { [create(:event), create(:event), create(:event)] }

  before do
    @events = Kaminari.paginate_array(events).page(1)
    render
  end

  it 'renders the event partials' do
    @events.each do |event|
      expect(rendered).to have_content(event.name.to_s)
      expect(rendered).to have_content(event.fee.to_s)
      expect(rendered).to have_content(format_date(event.start_date).to_s)
      expect(rendered).to have_content(format_time(event.start_time, event.time_zone).to_s)
      expect(rendered).to have_content(format_date(event.end_date).to_s)
      expect(rendered).to have_content(format_time(event.end_time, event.time_zone).to_s)
    end
  end
end
