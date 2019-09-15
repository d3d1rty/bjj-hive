# frozen_string_literal: true

require 'rails_helper'

describe 'events/new', type: :view do
  let(:user) { create(:user) }

  before do
    @user = user
    @event = Event.new
    render
  end

  it 'renders the new event form' do
    assert_select 'form[action=?][method=?]', user_events_path(@user), 'post' do
      assert_select 'input[name=?]', 'event[name]'
      assert_select 'trix-editor'
      assert_select 'input[name=?]', 'event[fee]'
      assert_select 'input[name=?]', 'event[start_date]'
      assert_select 'select[name=?]', 'event[start_time_hr]'
      assert_select 'select[name=?]', 'event[start_time_min]'
      assert_select 'select[name=?]', 'event[start_time_period]'
      assert_select 'input[name=?]', 'event[end_date]'
      assert_select 'select[name=?]', 'event[end_time_hr]'
      assert_select 'select[name=?]', 'event[end_time_min]'
      assert_select 'select[name=?]', 'event[end_time_period]'
      assert_select 'select[name=?]', 'event[time_zone]'
    end
  end
end
