UserBooks::Application.routes.draw do
  resources :books


  devise_for :users
  root :to => 'books#index'
end
