Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts, only: %w[index new create]

  # Defines the root path route ("/")
  root "posts#index"
end
