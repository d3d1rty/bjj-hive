Rails.application.routes.draw do
  # Clearance routes to constrains signed in users to the dashboard
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboard#show', as: :signed_in_root
  end

  # Clearance routes to constrain signed out users to the public pages
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'public#index'
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

  # Application route for dashboard
  get 'dashboard', to: 'dashboard#show', as: :dashboard

  root 'sessions#new'
end
