# frozen_string_literal: true

Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new(&:admin?) do
    scope 'admin' do
      get '/', to: 'admin#index', as: 'admin'
      mount Blazer::Engine, at: 'analytics'
    end
  end

  # Clearance routes for users and passwords for password resets
  resources :users, controller: 'users', only: %i[new create] do
    resource :password, controller: 'clearance/passwords',
                        only: %i[create edit update]
  end

  # Clearance routes for passwords
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]

  # Clearance routes for login
  resource :session, controller: 'sessions', only: %i[create new]

  get 'sign_in', to: 'sessions#new'

  get 'sign_up', to: 'users#new'

  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  resources :users, except: %i[index destroy] do
    resources :locations
    resources :events, except: %i[index show] do
      post :favorite, to: 'favorite_events#create', on: :member
      delete :unfavorite, to: 'favorite_events#destroy', on: :member
    end
    resources :favorite_events, path: :favorites, only: :index
  end

  get 'users/:id/settings', to: 'users#settings', as: 'user_settings'

  get 'users/:id/organizer', to: 'users#organizer_prompt', as: 'organizer_prompt'

  get 'users/:id/location', to: 'users#location_prompt', as: 'location_prompt'

  get 'events', to: 'events#index', as: :events

  get 'events/:id', to: 'events#show', as: :event

  root 'events#index'
end
