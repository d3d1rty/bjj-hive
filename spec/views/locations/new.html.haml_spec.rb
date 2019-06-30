# frozen_string_literal: true

require 'rails_helper'

describe 'locations/new', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    @user = user
    @location = Location.new
    render
  end

  it 'renders the new location form' do
    assert_select 'form[action=?][method=?]', user_locations_path(@user), 'post' do
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
