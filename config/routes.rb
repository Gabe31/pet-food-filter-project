Rails.application.routes.draw do
  root to: "sessions#welcome"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/auth/:provider/callback", to: "sessions#omniauth"
  #http://localhost:3000/auth/google_oauth2/callback
  resources :reviews
  resources :pet_foods do 
    resources :reviews
  end 
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
