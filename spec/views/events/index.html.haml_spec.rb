# frozen_string_literal: true

require 'rails_helper'

describe 'events/index', type: :view do
  let(:events) { [create(:event), create(:event), create(:event)] }

  before do
    @events = Kaminari.paginate_array(events).page(1)
    allow(view).to receive(:search_form_for).and_return(true)
    render
  end

  it 'renders the event partials' do
    @events.each do |event|
      expect(rendered).to have_content(event.name.to_s)
      expect(rendered).to have_content(event.fee.to_s)
      expect(rendered).to have_content(format_date_and_zone(event.start_date, event.time_zone))
      expect(rendered).to have_content(format_date_and_zone(event.end_date, event.time_zone))
    end
  end
end
