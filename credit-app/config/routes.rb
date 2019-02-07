Rails.application.routes.draw do

  resources :activities

  patch '/users/:user_id/accounts', to: 'accounts#deposit'
  patch '/users/:user_id/accounts', to: 'accounts#withdraw'
  patch '/users/:user_id/accounts', to: 'accounts#close'

  resources :users, only: [] do
  resources :accounts
  end
  devise_for :users
  root to: 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
