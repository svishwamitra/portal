Crm::Engine.routes.draw do
  get 'contacts/page/:page', to: 'contacts#index'
  get 'contacts/char/:char', to: 'contacts#index'
  get 'contacts/char/:char/page/:page', to: 'contacts#index'
  resources :contacts

end
