# frozen_string_literal: true

require 'rails_helper'

describe Reply, type: :model do
  let(:user) { create(:user) }
  let!(:post) { user.posts.create(attributes_for(:post)) }
  let!(:reply) { post.replies.create(attributes_for(:reply)) }

  context 'validations' do
    it { should validate_presence_of :body }
    it { should validate_length_of :body }
    it { should belong_to :user }
    it { should belong_to :post }
  end
end
