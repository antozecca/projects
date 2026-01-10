Rails.application.routes.draw do
  root 'pages#home'

  # Pagine statiche
  get 'logReg', to: 'pages#logReg', as: 'logReg'

  # Autenticazione
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  # Conferma email
  get 'confirm_email', to: 'users#confirm_email'
  get 'confirm/:token', to: 'users#confirm', as: 'confirm_user'

  # Account utente
  get 'accountUtente', to: 'users#accountUtente'

  # Modifica password
  post 'modify_password', to: 'users#modify_password', as: 'modify_password'

  # Password reset
  post 'request_password_reset', to: 'users#request_password_reset'
  get 'edit_password', to: 'users#edit_password', as: 'edit_password'
  patch 'update_password', to: 'users#update_password'

  # Ricerca campi
  get 'search_fields', to: 'fields#search', as: 'search_fields'

  # Rotte per `users`
  resources :users, only: [:new, :create, :edit, :update, :destroy] do
    member do
      get 'accountUtente', to: 'users#accountUtente', as: 'accountUtente'
      get 'bookings', to: 'bookings#index'
      get 'reviews', to: 'reviews#user_index'
      get 'reports', to: 'reports#user_index'
    end
  end

  # Rotte per `sessions`
  resources :sessions, only: [:new, :create, :destroy]

  # Rotte per `fields`
  resources :fields do
    get 'reviews', to: 'reviews#field_reviews', as: :field_reviews
    resources :slots, only: [:index]
    resources :reviews, only: [:index, :new, :create]
  end

  # Rimuovi la duplicazione delle risorse `reviews` per evitare conflitti
  resources :reviews, only: [:destroy]

  # Rotte per `bookings`
  resources :bookings, only: [:index, :destroy] do
    resources :reports, only: [:create]
  end

  # Rotte per `reports`
  resources :reports, only: [:index] do
    member do
      patch :accept
      patch :reject
    end
  end

  # Rotte per il checkout
  post 'checkout/create', to: 'checkout#create'
  get 'checkout/success', to: 'checkout#success'
  get 'checkout/cancel', to: 'checkout#cancel', as: 'checkout_cancel'

  # Rotte per partner
  get       'partner_sign_up',        to: 'partners#new'
  get       'partner_log_in',         to: 'sessions#new'
  post      'partner_log_in',         to: 'sessions#create'
  delete    'partner_log_out',        to: 'sessions#destroy'
  get       'partner_dashboard',      to: 'partners#dashboard'
  get       'partner_index',          to: 'partners#index'
  resources :partners, only: [:create]
  resources :partner_activations, only: [:edit]
  resources :partner_password_resets, only: [:new, :create, :edit, :update]

  # Rotta per le recensioni del partner corrente
  get '/partner_reviews', to: 'reviews#partner_reviews', as: 'partner_reviews'

  get 'reverse_geocode', to: 'fields#reverse_geocode'

  # Administrators' routes
  get       'administrator_sign_up',      to: 'administrators#new'
  get       'administrator_log_in',       to: 'sessions#new'
  post      'administrator_log_in',       to: 'sessions#create'
  delete    'administrator_log_out',      to: 'sessions#destroy'
  get       'administrator_dashboard',    to: 'administrators#dashboard'
  post      'administrator_update',       to: 'administrators#update'
  delete    'administrator_destroy',      to: 'administrators#destroy'
  get       'administrator_index',        to: 'administrators#index'
  get       'administrator_profile',      to: 'administrators#edit'

  resources :administrators, only: [:create, :update, :index]

  # SportsCenters' routes
  get 'sports_centers_new', to: 'sports_centers#new'
  get 'sports_centers_edit', to: 'sports_centers#edit'
  patch 'sports_centers_update', to: 'sports_centers#update'
  delete 'sports_centers_destroy', to: 'sports_centers#destroy'

  get 'sports_centers_delegate_new', to: 'sports_centers#delegate_new'
  post 'sports_centers_delegate_create', to: 'sports_centers#delegate_create'
  get 'sports_centers_delegate_index', to: 'sports_centers#delegate_index'
  delete 'sports_centers_delegate_remove', to: 'sports_centers#delegate_remove'

  resources :sports_centers, only: [:new, :create, :index]

  get '/error', to: 'pages#home'

  get 'user_reviews', to: 'reviews#user_index', as: 'user_reviews'

  namespace :admin do
    resources :users, only: [:index, :create, :edit, :update, :destroy]
  end
end

