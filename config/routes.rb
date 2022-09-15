Rails.application.routes.draw do
  get 'users/dashboard'
  get 'users/account'
  devise_for :users
  root to: 'pages#home'

  get "info/rules", to: "pages#rules"

  patch "admissions/:id/accept", to: "admissions#accept", as: "admission/accept"
  patch "admissions/:id/reject", to: "admissions#reject", as: "admission/reject"

  resources :riders, only: [:index]
  resources :bets, only: [:index, :create, :new]
  resources :leagues do
    member do
      get :info
    end
    resources :admissions, only: [:create, :destroy, :new]
  end

  resources :results, only: [:index]

  resources :stages, only: [:show, :index] do
    resources :bets, only: [:create, :new]
    resources :results, only: [:create, :new]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
