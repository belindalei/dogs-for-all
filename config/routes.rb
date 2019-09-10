Rails.application.routes.draw do
  
  get '/pets', to: 'pets#index', as: "pets"
  get '/pets/new', to: 'pets#new', as: "new_pet"
  get "pets/cats", to: "pets#cat", as: "cat_pet"
  get "pets/dogs", to: "pets#dog", as: "dog_pet"
  get "pets/:id", to: "pets#show", as: "pet"
  get "pets/:id/edit", to: "pets#edit", as: "edit_pet"
  post "pets", to: "pets#create"
  patch "pets/:id", to: "pets#update"
  delete "pets/:id", to: "pets#destroy"

  resources :pets
  resources :owners
  resources :adoptions

  
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  root "pages#show", page: "home"
  
end
