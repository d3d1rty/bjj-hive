# frozen_string_literal: true

require 'rails_helper'

describe Post, type: :model do
  let(:user) { create(:user) }
  let!(:post) { user.posts.create(attributes_for(:post)) }

  context 'validations' do
    it { should validate_presence_of :subject }
    it { should validate_length_of :subject }
    it { should validate_presence_of :body }
    it { should validate_length_of :body }
    it { should belong_to :user }
  end
end
