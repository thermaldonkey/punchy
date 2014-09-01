Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :punches, only: [:index, :new, :create, :edit, :update]

  root to: "punches#index"
end
