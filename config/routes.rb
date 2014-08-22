Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :meetups
  resources :attendances, only: [:create, :destroy]
  resources :microposts, only: [:create, :destroy]

  # static pages
  root 'static_pages#home'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
  # users
  match '/signup', to: 'users#new', via: 'get'

  # sessions
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
