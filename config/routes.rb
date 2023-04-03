Rails.application.routes.draw do
  get "restaurants/:id/willSplit", to: "restaurants#willSplit", as: "restaurants_will_split"
  get "restaurants/:id/willNotSplit", to: "restaurants#willNotSplit", as: "restaurants_will_not_split"
  resources :restaurants, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
