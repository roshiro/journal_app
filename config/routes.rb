Rails.application.routes.draw do
  root  to: 'notes#index'

  devise_for :users, path: 'auth'

  resources :users
  resources :notes
end
