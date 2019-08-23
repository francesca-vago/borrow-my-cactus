Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'users#dashboard', as: :dashboard

 resources :plants do

  resources :bookings, only: [:create]
  resources :wishes, only: [:create, :destroy]

 end

resources :bookings, only: [:update, :destroy] do
  resources :reviews, only: [:new, :create]
 end

resources :reviews, only: [:show,:edit, :update, :destroy]
end
