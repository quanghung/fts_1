Fts1::Application.routes.draw do
  root "static_pages#index"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  match "/signin", to: "sessions#new", via: "get"
  match "/signout", to: "sessions#destroy", via: "delete"

  namespace :admin do
    
     resources :exams
     resources :subjects
     
  end
  
end
