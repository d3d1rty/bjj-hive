# frozen_string_literal: true

require 'rails_helper'

describe LocationsHelper, type: :helper do
  let(:location) { create(:location) }

  describe '#format_address' do
    it 'renders the formatted location address' do
      expect(format_address(location)).to eq("<p>#{location.address_line_one}\n<br />#{location.address_line_two}</p>")
    end
  end
end
