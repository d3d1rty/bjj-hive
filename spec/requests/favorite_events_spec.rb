# frozen_string_literal: true

require 'rails_helper'

describe FavoriteEventsController, type: :request do
  let(:user) { create(:user) }
  let(:organizer) { create(:user, :is_organizer) }
  let!(:location) { organizer.locations.create(attributes_for(:location)) }
  let(:event) { organizer.events.create(attributes_for(:event, location_id: location.id)) }

  context 'as a user without authentication' do
    describe 'GET #index' do
      it 'displays the favorite events a user has saved' do
        get user_favorite_events_path(user)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'POST #create' do
      it 'favorites an event for a user' do
        post favorite_user_event_path(event.user.id, event)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'DELETE #destroy' do
      it 'unfavorites an event for a user' do
        delete unfavorite_user_event_path(event.user.id, event)
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  context 'as a user with authentication' do
    describe 'GET #index' do
      it 'displays the favorite events a user has saved' do
        get user_favorite_events_path(user, as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'favorites an event for a user' do
        post favorite_user_event_path(event.user.id, event, as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'DELETE #destroy' do
      it 'unfavorites an event for a user' do
        delete unfavorite_user_event_path(event.user.id, event, as: user)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
