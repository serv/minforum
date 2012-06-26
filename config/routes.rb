Minforum::Application.routes.draw do
  root :to => "forums#index"

  resources :users
  resources :forums do
    resources :topics
  end
  resources :topics do 
    resources :posts
  end
  
  match '/signup', to: 'users#new'
end