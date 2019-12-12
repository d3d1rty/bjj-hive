# frozen_string_literal: true

require 'rails_helper'

describe 'events/edit', type: :view do
  let(:user) { create(:user) }
  let(:event) { create(:event) }

  before do
    @user = user
    @event = event
    render
  end

  it 'renders the edit event form' do
    assert_select 'form[action=?][method=?]', user_event_path(@user, @event), 'post' do
      assert_select 'input[name=?]', 'event[name]'
      assert_select 'trix-editor'
      assert_select 'input[name=?]', 'event[fee]'
      assert_select 'input[name=?]', 'event[start_date]'
      assert_select 'input[name=?]', 'event[end_date]'
      assert_select 'select[name=?]', 'event[time_zone]'
    end
  end
end
