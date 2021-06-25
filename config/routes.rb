Rails.application.routes.draw do
  devise_for :users
  resources :friend_tables
  #root "home#index"
  root "friend_tables#index"
  get "/about", to: "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
