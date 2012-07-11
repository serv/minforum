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
  resources :posts do
    resources :flagposts
  end
  resources :messages

  match '/signup',  to: 'users#new'
  match '/setting', to: 'users#setting'
  match '/users/:id/change_password', to: 'users#change_password'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/flagtopics', to: 'flagtopics#index'
  match '/flagposts', to: 'flagposts#index'
  match '/messages_sent', to: 'messages#sent'
  match '/about', to: 'pages#about'
  match '/privacy', to: 'pages#privacy'
end