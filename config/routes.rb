Rails.application.routes.draw do
  root  to: 'entries#index'

  devise_for :users, path: 'auth'

  resources :users
  resources :entries
end
