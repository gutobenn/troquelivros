Rails.application.routes.draw do
  get 'friends/index'

  get 'friends/destroy'

  resources :friend_requests
  resources :books
  resources :book_instances
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
end
