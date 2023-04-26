Rails.application.routes.draw do
  devise_for :users
  root to: "restaurants#index"
  get "restaurants/:id/willSplit", to: "restaurants#willSplit", as: "restaurants_will_split"
  get "restaurants/:id/willNotSplit", to: "restaurants#willNotSplit", as: "restaurants_will_not_split"
  get "restaurants/profile", to: "restaurants#profile", as: "restaurants_profile"
  resources :restaurants, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
