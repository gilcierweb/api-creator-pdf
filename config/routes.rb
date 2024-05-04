Rails.application.routes.draw do

  draw :admin

  draw :api

  get 'home/index'
  root to: "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

  match '*unmatched', to: 'application#route_not_found', via: :all

end
