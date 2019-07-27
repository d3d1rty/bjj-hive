# frozen_string_literal: true

require 'rails_helper'

describe CommentsController, type: :request do
  let(:user) { create(:user) }
  let(:organizer) { create(:user, :is_organizer) }
  let!(:location) { organizer.locations.create(attributes_for(:location)) }
  let(:event) { organizer.events.create(attributes_for(:event, location_id: location.id)) }
  let(:comment) { create(:comment, user_id: user.id, event_id: event.id) }

  context 'as a user without authentication' do
    describe 'GET #edit' do
      it 'redirects the user to the sign in page' do
        get edit_event_comment_path(event, comment)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'POST #create' do
      it 'redirects the user to the sign in page' do
        post event_comments_path(event.id, comment: attributes_for(:comment, user_id: user.id, event_id: event.id))
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects the user to the sign in page' do
        patch event_comment_path(event.id, comment, comment: { body: 'Test Update' })
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects the user to the sign in page' do
        delete event_comment_path(event.id, comment)
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  context 'as a user with authentication' do
    describe 'GET #edit' do
      it 'displays the edit comment page' do
        get edit_event_comment_path(event, comment, as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'creates an event comment record' do
        post event_comments_path(event.id, comment: attributes_for(:comment, user_id: user.id, event_id: event.id), as: user)
        expect(response).to redirect_to event_path(event)
      end
    end

    describe 'PATCH #update' do
      it 'updates an event comment record' do
        patch event_comment_path(event.id, comment, comment: { body: 'Test Update' }, as: user)
        expect(response).to redirect_to event_path(event)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes an event comment record' do
        delete event_comment_path(event.id, comment, as: user)
        expect(response).to redirect_to event_path(event)
      end
    end
  end
end
