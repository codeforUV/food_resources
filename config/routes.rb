# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#

Rails.application.routes.draw do
  root 'services#index'

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  get '/about', to: 'pages#about'
  get '/how_to_use', to: 'pages#how_to_use'

  resources :services, only: [:index, :show]

  resources :users, only: [] do
    resources :services, only: [:create, :new, :edit, :update, :destroy]
  end
end
