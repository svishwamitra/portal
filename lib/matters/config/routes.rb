Matters::Engine.routes.draw do
  get "matters/char/:char" => "matters#index"
  resources :matters
end
