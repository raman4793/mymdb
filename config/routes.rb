Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'

  get 'relationships/block/:id' => 'relationships#block', :as => 'block'

  get 'relationships/unblock/:id' => 'relationships#unblock', :as => 'unblock'

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  get 'relationships/', to: "relationships#index", as: :relationships

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

  authenticated :user do
    root to: 'users#home'
  end

  unauthenticated do
    root to: 'movies#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
