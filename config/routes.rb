Rails.application.routes.draw do
  devise_for :users
  root 'food_access_points#index'
  get "/food_access_points/:id", to: "food_access_points#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  resources :users do 
    resources :food_access_points
  end

  resources :food_access_points

  
end
