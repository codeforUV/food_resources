Rails.application.routes.draw do
  devise_for :users
  root 'food_access_points#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  resources :food_access_points, only: [:index, :show]

  resources :users do 
    resources :food_access_points, only: [:create, :new, :edit, :update, :destroy]
  end
  
end
