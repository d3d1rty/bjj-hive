# frozen_string_literal: true

require 'rails_helper'

describe 'events/show', type: :view do
  let(:user) { create(:user) }
  let(:event) { create(:event_with_comments, user_id: user.id) }
  let(:comments) { event.comments.all }

  before do
    sign_in
    @user = user
    @event = event
    @comments = comments
    render
  end

  it 'renders the event information' do
    expect(rendered).to have_content(/#{event.name}/)
    # expect(rendered).to have_content(/#{event.summary}/)
    expect(rendered).to have_content(/#{event.fee}/)
    expect(rendered).to have_content(format_date_and_zone(event.start_date, event.time_zone))
    expect(rendered).to have_content(format_date_and_zone(event.end_date, event.time_zone))
  end

  it 'render the new comment form' do
    assert_select 'form[action=?][method=?]', event_comments_path(@event), 'post' do
      assert_select 'trix-editor'
    end
  end
end
