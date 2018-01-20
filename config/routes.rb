Rails.application.routes.draw do
  get 'jokes/list'

  get 'jokes/index'

  get 'jokes/share'

  get 'jokes/like'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
