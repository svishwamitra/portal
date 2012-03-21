Company::Engine.routes.draw do

  get "accounts/char/:char", to: "accounts#index"
  resources :accounts

end
