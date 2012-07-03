Minforum::Application.routes.draw do
  root :to => "forums#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :forums do
    resources :topics
  end
  resources :topics do 
    resources :posts
    resources :flagtopics
  end
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/flagtopics', to: 'flagtopics#index'
end