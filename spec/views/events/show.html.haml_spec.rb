# frozen_string_literal: true

require 'rails_helper'

describe 'events/show', type: :view do
  let(:user) { create(:user) }
  let(:event) { create(:event, user_id: user.id) }

  before do
    @user = user
    @event = event
    render
  end

  it 'renders the event page' do
    expect(rendered).to have_content(/#{event.name}/)
    expect(rendered).to have_content(/#{event.summary}/)
    expect(rendered).to have_content(/#{event.fee}/)
    expect(rendered).to have_content(format_date(event.start_date).to_s)
    expect(rendered).to have_content(format_time(event.start_time, event.time_zone).to_s)
    expect(rendered).to have_content(format_date(event.end_date).to_s)
    expect(rendered).to have_content(format_time(event.end_time, event.time_zone).to_s)
  end
end
