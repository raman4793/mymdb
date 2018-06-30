Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "movies#index"

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
