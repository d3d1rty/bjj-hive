# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :model do
  let(:organizer) { create(:user, :is_organizer) }
  let!(:location) { organizer.locations.create(attributes_for(:location)) }
  let(:event) { organizer.events.create(attributes_for(:event, location_id: location.id)) }
  let(:comment) { create(:comment, user_id: user.id, event_id: event.id) }

  context 'validations' do
    it { should validate_presence_of :body }
    it { should validate_length_of :body }
    it { should belong_to :user }
    it { should belong_to :event }
  end
end
