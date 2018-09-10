Rails.application.routes.draw do
  resources :books
  resources :book_instances
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users
end
