Minforum::Application.routes.draw do
  root :to => "forums#index"
  resources :forums do
    resources :topics
  end
  resources :posts
end