# frozen_string_literal: true

require 'rails_helper'

describe PagesController, type: :request do
  let(:user) { create(:user) }

  context 'as a user without authentication' do
    describe 'GET #landing_page' do
      it 'displays the landing page' do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #about' do
      it 'displays the about page' do
        get about_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #privacy_policy' do
      it 'redirects the user to the sign in page' do
        get privacy_policy_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #terms_of_service' do
      it 'displays the terms of service page' do
        get terms_of_service_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #contact_us' do
      it 'displays the contact us page' do
        get contact_us_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #contact' do
      context 'with valid parameters' do
        it 'submits the contact form and redirects to the root path' do
          allow(ContactUsMailer).to receive_message_chain(:send_inquiry, :deliver).and_return true
          post contact_path(name: 'Test Name', email: 'test@email.com', reason: 'Test Reason', message: 'Test Message')
          expect(response).to redirect_to root_path
        end
      end

      # context 'with invalid parameters' do
      #   it 'fails to submit the contact form and redirects to the contact us path' do
      #     post contact_path
      #     expect(response).to redirect_to contact_us_path
      #   end
      # end
    end

    describe 'GET #sitemap' do
      it 'renders the sitemap' do
        get sitemap_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'as a user with authentication' do
    describe 'GET #landing_page' do
      it 'displays the landing page' do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #about' do
      it 'displays the about page' do
        get about_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #privacy_policy' do
      it 'redirects the user to the sign in page' do
        get privacy_policy_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #terms_of_service' do
      it 'displays the terms of service page' do
        get terms_of_service_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #contact_us' do
      it 'displays the contact us page' do
        get contact_us_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #contact' do
      context 'with valid parameters' do
        it 'submits the contact form and redirects to the root path' do
          allow(ContactUsMailer).to receive_message_chain(:send_inquiry, :deliver).and_return true
          post contact_path(name: 'Test Name', email: 'test@email.com', reason: 'Test Reason', message: 'Test Message')
          expect(response).to redirect_to root_path
        end
      end

      # context 'with invalid parameters' do
      #   it 'fails to submit the contact form and redirects to the contact us path' do
      #     post contact_path
      #     expect(response).to redirect_to contact_us_path
      #   end
      # end
    end

    describe 'GET #sitemap' do
      it 'renders the sitemap' do
        get sitemap_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
