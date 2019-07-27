# frozen_string_literal: true

require 'rails_helper'

describe EventsController, type: :request do
  let(:user) { create(:user) }
  let(:organizer) { create(:user, :is_organizer) }
  let!(:location) { organizer.locations.create(attributes_for(:location)) }
  let(:event) { organizer.events.create(attributes_for(:event, location_id: location.id)) }

  context 'as a user without authentication' do
    describe 'GET #index' do
      it 'displays the event listing' do
        get events_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'displays the event page' do
        get event_path(event.id)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'redirects the user to the sign in page' do
        get new_user_event_path(user)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'GET #edit' do
      it 'redirects the user to the sign in page' do
        get edit_user_event_path(organizer, event)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'POST #create' do
      it 'redirects the user to the sign in page' do
        post user_events_path(organizer, event: attributes_for(:event, user_id: user.id, location_id: location.id))
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects the user to the sign in page' do
        patch user_event_path(organizer, event, event: { name: 'Test Update' })
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects the user to the sign in page' do
        delete user_event_path(organizer, event)
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  context 'as a user with authentication who is not an organizer' do
    describe 'GET #index' do
      it 'displays the events listing' do
        get events_path(as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'displays the event page' do
        get event_path(id: event, as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'redirects the user and displays the unauthorized message' do
        get new_user_event_path(user, as: user)
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq([I18n.t('alerts.unauthorized')])
      end
    end

    describe 'GET #edit' do
      it 'redirects the user and displays the unauthorized message' do
        get edit_user_event_path(organizer, event, as: user)
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq([I18n.t('alerts.unauthorized')])
      end
    end

    describe 'POST #create' do
      it 'redirects the user and displays the unauthorized message' do
        post user_events_path(organizer, event: attributes_for(:event, user_id: user.id), as: user)
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq([I18n.t('alerts.unauthorized')])
      end
    end

    describe 'PATCH #update' do
      it 'redirects the user and displays the unauthorized message' do
        patch user_event_path(organizer, event, event: attributes_for(:event, name: 'Test Update', user_id: user.id), as: user)
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq([I18n.t('alerts.unauthorized')])
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects the user and displays the unauthorized message' do
        delete user_event_path(organizer, event, as: user)
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq([I18n.t('alerts.unauthorized')])
      end
    end
  end

  context 'as a user with authentication who is an organizer' do
    describe 'GET #index' do
      it 'displays the events listing' do
        get events_path(as: organizer)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'displays the event page' do
        get event_path(event)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'displays the new event page' do
        get new_user_event_path(organizer, as: organizer)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #edit' do
      it 'displays the edit event page' do
        get edit_user_event_path(organizer, event, as: organizer)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'creates an event record' do
        post user_events_path(organizer, event: attributes_for(:event, user_id: organizer.id, location_id: location.id), as: organizer)
        expect(response).to redirect_to event_path(Event.last)
      end
    end

    describe 'PATCH #update' do
      it 'updates an event record' do
        patch user_event_path(organizer, event, event: attributes_for(:event, name: 'Test Update', user_id: organizer.id, location_id: location.id), as: organizer)
        expect(response).to redirect_to event_path(event)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes an event record' do
        delete user_event_path(organizer, event, as: organizer)
        expect(response).to redirect_to events_path
      end
    end
  end
end
