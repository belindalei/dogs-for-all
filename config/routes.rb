Rails.application.routes.draw do
  resources :cats 
  resources :dogs
  resources :owners
  resources :adoptions

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  
end
