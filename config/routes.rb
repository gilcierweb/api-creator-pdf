Rails.application.routes.draw do

  draw :api

  get 'home/index'

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "home#index"
end
