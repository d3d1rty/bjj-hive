# frozen_string_literal: true

require 'rails_helper'

describe 'locations/edit', type: :view do
  let(:user) { create(:user) }
  let(:location) { create(:location) }

  before(:each) do
    @user = user
    @location = location
    render
  end

  it 'renders the edit location form' do
    assert_select 'form[action=?][method=?]', user_location_path(@user, @location), 'post' do
      assert_select 'input[name=?]', 'location[name]'
      assert_select 'input[name=?]', 'location[street_address]'
      assert_select 'input[name=?]', 'location[city]'
      assert_select 'input[name=?]', 'location[state]'
      assert_select 'input[name=?]', 'location[zip]'
      assert_select 'input[name=?]', 'location[country]'
      assert_select 'input[name=?]', 'location[user_id]'
    end
  end
end
