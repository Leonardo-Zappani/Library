Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :readers
  root 'books#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'signup' }
  get 'logout', to: 'pages#logout', as: 'logout'

  resources :subscribe, only: [:index]
  resources :dashboard, only: [:index]
  resources :account, only: [:index, :update]
  resources :books, controller: :books
  resources :users

  # static pages
  pages = %w[
    privacy terms
  ]

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: page.gsub('-', '_').to_s
  end

  post '/invite' => 'users#invite', as: 'invite'

  # admin panels
  authenticated :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :dashboard, only: [:index]
      resources :impersonations, only: [:new]
      resources :users, only: [:edit, :update, :destroy]
    end

    # convenience helper
    get 'books_dashboard', to: 'dashboard#index'
    get 'readers_dashboard', to: 'dashboard#index'
  end
end
