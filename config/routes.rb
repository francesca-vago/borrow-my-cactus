Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'users#dashboard', as: :dashboard


 resources :plants do
  resources :bookings, only: [:new, :create]
  resources :wishes, only: :create
 end

resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
  resources :reviews, only: [:new, :create]
 end

resources :reviews, only: [:index, :edit, :update, :destroy]
end
