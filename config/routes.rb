Rails.application.routes.draw do
  #get 'microposts/create'

  #get 'microposts/destroy'

  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  #get 'users/index'

  #get 'users/show'

  #get 'users/new'

  #get 'users/create'

  #get 'toppages/index'

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      
      get :likes
      #get :favorite_users
    end
    #collection do
    #  get :search
    #end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
