Rails.application.routes.draw do
  get 'search/index'
  get 'categories/index'
  get 'categories/list'
  get 'products/index'
  get 'products/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'
  get '/Products/index', to:'products#index'
  get '/Products/show', to:'products#show'
  get '/Categories/index', to:'categories#index'
  get '/Categories/list', to:'categories#list'
  get '/Search/result', to:'search#index'
end
