# frozen_string_literal: true

require 'rails_helper'

describe FavoriteEvent, type: :model do
  context 'validations' do
    it { should belong_to :user }
    it { should belong_to :event }
  end
end
