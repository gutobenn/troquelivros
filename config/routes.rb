Rails.application.routes.draw do
  resources :books
  resources :book_instances
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :conversations, only: [:create, :index] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
end
