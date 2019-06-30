# frozen_string_literal: true

require 'rails_helper'

describe Location, type: :model do
  let(:location) { create(:location) }

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_length_of :name }
    it { should validate_presence_of :street_address }
    it { should validate_length_of :street_address }
    it { should validate_presence_of :city }
    it { should validate_length_of :city }
    it { should validate_presence_of :state }
    it { should validate_length_of :state }
    it { should validate_presence_of :zip }
    it { should validate_length_of :zip }
    it { should validate_presence_of :country }
    it { should validate_length_of :country }
    it { should belong_to :user }
  end

  describe '#address' do
    it 'returns the full address for the location' do
      expect(location.address).to eq("#{location.street_address}, #{location.city}, #{location.state}, #{location.zip}, #{location.country}")
    end
  end

  describe '#address_line_one' do
    it 'returns the first line of the location address' do
      expect(location.address_line_one).to eq(location.street_address)
    end
  end

  describe '#address_line_two' do
    it 'returns the second line of the location address' do
      expect(location.address_line_two).to eq("#{location.city}, #{location.state}, #{location.zip}, #{location.country}")
    end
  end
end
