Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/pages/dashboard', to: 'pages#dashboard'
  resources :dogs, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create, :show]
  end
end
