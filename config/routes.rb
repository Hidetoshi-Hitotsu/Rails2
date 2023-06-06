Rails.application.routes.draw do
  
  

  get 'rooms/index'
  devise_for :users
  get 'users/show'
  get 'users/profile'
  get 'users/profile/edit', to: 'users#edit'
  patch 'users/profile', to: 'users#update'
  root to: 'home#index'

  resources :rooms
  get 'room/own', to: 'rooms#own'

  resources :reservations, only: [:index, :create, :destroy] 
  get 'reservation/own', to: 'reservations#own'
  # get 'reservations/index'
  post 'reservations/confirm'
  # post 'reservations/confirms'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
