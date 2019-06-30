# frozen_string_literal: true

require 'rails_helper'

describe AdminController, type: :request do
  let(:user) { create(:user) }
  let(:organizer) { create(:user, :is_organizer) }
  let(:admin) { create(:user, :is_admin) }

  context 'as a user without authentication' do
    describe 'GET #index' do
      it 'raises a routing error' do
        expect { get admin_path }.to raise_error(ActionController::RoutingError)
      end
    end
  end

  context 'as a user with authentication who is non-privileged user' do
    describe 'GET #index' do
      it 'raises a routing error' do
        expect { get admin_path(as: user) }.to raise_error(ActionController::RoutingError)
      end
    end
  end

  context 'as a user with authentication who is an organizer' do
    describe 'GET #index' do
      it 'raises a routing error' do
        expect { get admin_path(as: organizer) }.to raise_error(ActionController::RoutingError)
      end
    end
  end

  context 'as a user with authentication who is an admin' do
    describe 'GET #index' do
      it 'displays the admin panel' do
        get admin_path(as: admin)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
