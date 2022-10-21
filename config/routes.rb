Rails.application.routes.draw do
  root "profiles#index"
  resources :profiles, only: [:index, :new, :create]
  resources :employers, only: [:new, :create]
end
