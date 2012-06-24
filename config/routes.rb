Minforum::Application.routes.draw do
  get "users/new"
  
  root :to => "forums#index"
  resources :forums do
    resources :topics
  end
  resources :topics do 
    resources :posts
  end
  
  match '/signup', to: 'users#new'
end