Company::Engine.routes.draw do
  get "accounts/char/:char" => "accounts#index"
  resources :accounts
end
