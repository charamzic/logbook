Rails.application.routes.draw do
  resources :fuel_types
  resources :vehicles
  devise_for :users
  resources :trips
  get "home/index"

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "trips#index"
end
