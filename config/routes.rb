Minforum::Application.routes.draw do
  root :to => "forums#index"
  resources :forums do
    resources :topics do 
      resources :posts
    end
  end
end