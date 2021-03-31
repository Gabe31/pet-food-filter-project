Rails.application.routes.draw do
  root to: "sessions#welcome"
  get "/login", to: "sessions#new"
  post "/login", to: "session#create"
  delete "/logout", to: "sessions#destroy"
  resources :reviews
  resources :pet_foods do 
    resources :reviews
  end 
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
