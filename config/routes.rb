Rails.application.routes.draw do
  get 'jokes/list'

  get 'jokes/index'

  get 'jokes/share'

  get 'jokes/like'

  get 'home/index'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: :get
  delete '/logout', to: 'session#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
