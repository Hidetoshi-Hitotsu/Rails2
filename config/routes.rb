Rails.application.routes.draw do
  
  get 'reservations/index'
  post 'reservations/confirm'
  get 'rooms/index'
  devise_for :users
  get 'users/show'
  get 'users/profile'
  get 'users/profile/edit', to: 'users#edit'
  patch 'users/profile', to: 'users#update'
  root to: 'home#index'

  resources :rooms
  get 'room/own', to: 'rooms#own'

  resources :reservations
  get 'reservation/own', to: 'reservations#own'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
