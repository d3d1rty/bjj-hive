# frozen_string_literal: true

require 'rails_helper'

describe RepliesController, type: :request do
  let(:user) { create(:user) }
  let(:user_post) { user.posts.create(attributes_for(:post)) }
  let(:reply) { create(:reply, user_id: user.id, post_id: user_post.id) }

  context 'as a user without authentication' do
    describe 'GET #edit' do
      it 'redirects the user to the sign in page' do
        get edit_post_reply_path(user_post, reply)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'POST #create' do
      it 'redirects the user to the sign in page' do
        post post_replies_path(user_post, reply: attributes_for(:reply, user_id: user.id, post_id: user_post.id))
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects the user to the sign in page' do
        patch post_reply_path(user_post, reply, reply: { name: 'Test Update' })
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects the user to the sign in page' do
        delete post_reply_path(user_post, reply)
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  context 'as a user with authentication' do
    describe 'GET #edit' do
      it 'displays the edit reply page' do
        get edit_post_reply_path(user_post, reply, as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'creates a post reply record' do
        post post_replies_path(user_post, reply: attributes_for(:reply, user_id: user.id, post_id: user_post.id), as: user)
        expect(response).to redirect_to post_path(user_post)
      end
    end

    describe 'PATCH #update' do
      it 'updates a post reply record' do
        patch post_reply_path(user_post, reply, reply: { name: 'Test Update' }, as: user)
        expect(response).to redirect_to post_path(user_post)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes a post reply record' do
        delete post_reply_path(user_post, reply, as: user)
        expect(response).to redirect_to post_path(user_post)
      end
    end
  end
end
