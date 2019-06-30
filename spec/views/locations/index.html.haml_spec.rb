# frozen_string_literal: true

require 'rails_helper'

describe 'locations/index', type: :view do
  let(:user) do
    create(:user) do |user|
      user.locations.create(attributes_for(:location))
      user.locations.create(attributes_for(:location))
      user.locations.create(attributes_for(:location))
    end
  end

  before(:each) do
    @user = user
    @locations = @user.locations.all
    render
  end

  it 'renders the locations' do
    @locations.each do |location|
      expect(rendered).to match(/#{location.name}/)
      expect(rendered).to match(/#{format_address(location)}/)
    end
  end
end
