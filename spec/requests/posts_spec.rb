# frozen_string_literal: true

require 'rails_helper'

describe PostsController, type: :request do
  let(:user) { create(:user) }
  let(:user_post) { user.posts.create(attributes_for(:post)) }

  context 'as a user without authentication' do
    describe 'GET #index' do
      it 'displays the post listing' do
        get posts_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'displays the post page' do
        get post_path(user_post.id)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'redirects the user to the sign in page' do
        get new_user_post_path(user)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'GET #edit' do
      it 'redirects the user to the sign in page' do
        get edit_user_post_path(user, user_post)
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'POST #create' do
      it 'redirects the user to the sign in page' do
        post user_posts_path(user, post: attributes_for(:post, user_id: user.id))
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects the user to the sign in page' do
        patch user_post_path(user, user_post, post: { subject: 'Test Update' })
        expect(response).to redirect_to sign_in_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects the user to the sign in page' do
        delete user_post_path(user, user_post)
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  context 'as a user with authentication' do
    describe 'GET #index' do
      it 'displays the posts listing' do
        get posts_path(as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'displays the post page' do
        get post_path(user_post)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'displays the new post page' do
        get new_user_post_path(user, as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #edit' do
      it 'displays the edit post page' do
        get edit_user_post_path(user, user_post, as: user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'creates an post record' do
        post user_posts_path(user, post: attributes_for(:post), as: user)
        expect(response).to redirect_to post_path(Post.last)
      end
    end

    describe 'PATCH #update' do
      it 'updates an post record' do
        patch user_post_path(user, user_post, post: attributes_for(:post, subject: 'Test Update'), as: user)
        expect(response).to redirect_to post_path(user_post)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes an post record' do
        delete user_post_path(user, user_post, as: user)
        expect(response).to redirect_to posts_path
      end
    end
  end
end
