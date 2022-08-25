Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "/info", to: "pages#info"
  get "info/profile", to: "pages#profile"
  get "info/my_results", to: "pages#my_results"
  get "info/rules", to: "pages#rules"
  get "info/about", to: "pages#about"

  resources :riders, only: [:index]
  resources :bets, only: [:index, :create, :new]
  resources :leagues do
    resources :admissions, only: [:create, :destroy, :new]
  end

  resources :stages, only: [:show, :index] do
    resources :bets, only: [:create, :new]
    resources :results, only: [:create, :new]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
