Rails.application.routes.draw do
  root 'food_access_points#index'
  get "/food_access_points/:id", to: "food_access_points#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
