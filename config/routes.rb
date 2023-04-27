Rails.application.routes.draw do
  devise_for :users
  root to: "restaurants#index"
  get "restaurants/:id/willSplit", to: "restaurants#willSplit", as: "restaurants_will_split"
  get "restaurants/:id/willNotSplit", to: "restaurants#willNotSplit", as: "restaurants_will_not_split"
  get "restaurants/:id/favorite", to: "restaurants#favorite", as: "restaurants_favorite"
  get "restaurants/:id/comment", to: "restaurants#comment", as: "restaurants_comment"
  get "restaurants/:id/comment_add", to: "restaurants#addComment", as: "restaurants_comment_add"
  get "restaurants/profile", to: "restaurants#profile", as: "restaurants_profile"
  resources :restaurants, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
