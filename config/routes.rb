Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :riders, only: [:index]
  resources :stages, only: [:show, :index]
  resources :bets, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
