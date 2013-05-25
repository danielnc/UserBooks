UserBooks::Application.routes.draw do
  resources :books

  match "/rate/:id" => "rate#update"

  devise_for :users
  root :to => 'books#index'
end
