# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#

Rails.application.routes.draw do
  devise_for :users
  root 'food_access_points#index'

  get '/about', to: 'pages#about'
  get '/how_to_use', to: 'pages#how_to_use'

  resources :food_access_points, only: [:index, :show]

  resources :users do
    resources :food_access_points, only: [:create, :new, :edit, :update, :destroy]
  end
  
  # resources :user do
  #   resources :food_access_points, only: [:create, :new, :edit, :update, :destroy]
  # end

end
