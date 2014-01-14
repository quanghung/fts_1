Fts1::Application.routes.draw do
  root "static_pages#index"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  match "/signin", to: "sessions#new", via: "get"
  match "/signout", to: "sessions#destroy", via: "delete"

  namespace :admin do
    root "static_pages#index"
    resources :sessions, only: [:new, :create, :destroy]
    resources :users
    resources :exams
    resources :subjects

    match "/signin", to: "sessions#new", via: :get
    match "/signout", to: "sessions#destroy", via: :delete
  end
end
