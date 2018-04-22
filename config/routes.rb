Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :technicians
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "pages#home"

  resources :movies
  resources :reviews
  resources :comments
  resources :likes
  resources :conversations
  resources :messages
  resources :users, only: [:show, :index]
  resources :technicians, only: [:show, :index]
  resources :relationships, only: [:create, :destroy]

  mount Thredded::Engine => '/forum'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
