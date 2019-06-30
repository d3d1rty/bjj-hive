# frozen_string_literal: true

require 'rails_helper'

describe LocationsController, type: :request do
  let(:user) { create(:user) }
  let(:organizer) { create(:user, :is_organizer) }
  let!(:location) { organizer.locations.create(attributes_for(:location)) }

  context 'as a user without authentication' do
    describe 'GET #index' do
      it 'displays the location listing' do
        get user_locations_path(organizer)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'GET #new' do
      it 'redirects the user to the sign in page' do
        get new_user_location_path(organizer)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'GET #edit' do
      it 'redirects the user to the sign in page' do
        get edit_user_location_path(organizer, location)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'POST #create' do
      it 'redirects the user to the sign in page' do
        post user_locations_path(organizer, location: attributes_for(:location, user_id: organizer.id))
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects the user to the sign in page' do
        patch user_location_path(organizer, location, location: { name: 'Test Update' })
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects the user to the sign in page' do
        delete user_location_path(organizer, location)
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  context 'as a user with authentication who is not an organizer' do
    describe 'GET #index' do
      it 'redirects the user to the root path' do
        get user_locations_path(user, as: user)
        expect(response).to redirect_to root_path
      end
    end

    describe 'GET #new' do
      it 'redirects the user to the root path' do
        get new_user_location_path(user, as: user)
        expect(response).to redirect_to root_path
      end
    end

    describe 'GET #edit' do
      it 'redirects the user to the root path' do
        get edit_user_location_path(user, location, as: user)
        expect(response).to redirect_to root_path
      end
    end

    describe 'POST #create' do
      it 'redirects the user to the root path' do
        post user_locations_path(user, location: attributes_for(:location, user_id: organizer.id), as: user)
        expect(response).to redirect_to root_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects the user to the root path' do
        patch user_location_path(user, location, location: { name: 'Test Update' }, as: user)
        expect(response).to redirect_to root_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects the user to the root path' do
        delete user_location_path(user, location, as: user)
        expect(response).to redirect_to root_path
      end
    end
  end

  context 'as a user with authentication who is an organizer' do
    describe 'GET #index' do
      it 'displays the locations listing' do
        get user_locations_path(organizer, as: organizer)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'displays the new location page' do
        get new_user_location_path(organizer, as: organizer)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #edit' do
      it 'displays the edit location page' do
        get edit_user_location_path(organizer, location, as: organizer)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'creates an location record' do
        post user_locations_path(organizer, location: attributes_for(:location, user_id: organizer.id), as: organizer)
        expect(response).to redirect_to user_locations_path(organizer)
      end
    end

    describe 'PATCH #update' do
      it 'updates an location record' do
        patch user_location_path(organizer, location, location: attributes_for(:location, name: 'Test Update', user_id: organizer.id), as: organizer)
        expect(response).to redirect_to user_locations_path(organizer)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes an location record' do
        delete user_location_path(organizer, location, as: organizer)
        expect(response).to redirect_to user_locations_path(organizer)
      end
    end
  end
end
