# frozen_string_literal: true

Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new(&:admin?) do
    scope 'admin' do
      get '/', to: 'admin#index', as: 'admin'
      mount Blazer::Engine, at: 'analytics'
    end
  end

  resources :users, except: %i[index destroy] do
    resource :password, controller: 'passwords', only: %i[create edit update]
    resources :locations
    resources :events, except: %i[index show] do
      post :favorite, to: 'favorite_events#create', on: :member
      delete :unfavorite, to: 'favorite_events#destroy', on: :member
    end
    resources :favorite_events, path: :favorites, only: :index
    resources :posts, except: %i[index show]
  end

  resources :events, only: %i[index show] do
    resources :comments, only: %i[edit create update destroy]
  end

  resources :posts, only: %i[index show] do
    resources :replies, only: %i[edit create update destroy]
  end

  resources :passwords, controller: 'passwords', only: %i[create new]

  resource :session, controller: 'sessions', only: %i[create new]

  get '/sign_in', to: 'sessions#new'

  get '/sign_up', to: 'users#new'

  delete '/sign_out', to: 'sessions#destroy', as: 'sign_out'

  get '/users/:id/settings', to: 'users#settings', as: 'user_settings'

  get '/users/:id/organizer', to: 'users#organizer_prompt', as: 'organizer_prompt'

  get '/users/:id/location', to: 'users#location_prompt', as: 'location_prompt'

  post '/accept_cookies', to: 'application#accept_cookies', as: 'accept_cookies'

  get '/about', to: 'pages#about', as: 'about'

  get '/privacy_policy', to: 'pages#privacy_policy', as: 'privacy_policy'

  get '/terms_of_service', to: 'pages#terms_of_service', as: 'terms_of_service'

  get '/contact_us', to: 'pages#contact_us', as: 'contact_us'

  post '/contact', to: 'pages#contact', as: 'contact'

  scope 'help' do
    get '/markdown', to: 'pages#markdown', as: 'markdown'
  end

  get '/', to: 'pages#landing_page'

  root 'pages#landing_page'
end
