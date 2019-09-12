Rails.application.routes.draw do
  
  #PET ROUTES
  get '/pets', to: 'pets#index', as: "pets"
  get "pets/cats", to: "pets#cat", as: "cat_pet"
  get "pets/dogs", to: "pets#dog", as: "dog_pet"
  get "pets/new", to: "pets#new", as: "new_pet"
  post "pets", to: "pets#create"
  get "pets/:id", to: "pets#show", as: "pet"
  delete "pets/:id", to: "pets#destroy"

  #ADOPTION ROUTES
  get '/adoptions', to: 'adoptions#index', as: "adoptions"
  get '/adoptions/adopt_cat', to: 'adoptions#adopt_cat', as: "adopt_cat"
  get '/adoptions/adopt_dog', to: 'adoptions#adopt_dog', as: "adopt_dog"
  get '/adoptions/new', to: 'adoptions#new', as: "new_adoption"
  get "adoptions/:id", to: "adoptions#show", as: "adoption"
  get "adoptions/:id/edit", to: "adoptions#edit", as: "edit_adoption"
  post '/adoptions', to: 'adoptions#create', as: "create_adoption"

  post "adoptions/adopt_dog", to: "adoptions#create_dog"
  post "adoptions/adopt_cat", to: "adoptions#create_cat"
  patch "adoptions/:id", to: "adoptions#update"
  delete "adoptions/:id", to: "adoptions#destroy", as: "delete_adoption"

  resources :pets
  resources :owners

  
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  root "pages#show", page: "home"
  
end
