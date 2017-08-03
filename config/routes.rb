Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"

  get '/pages/dashboard', to: 'pages#dashboard'
  resources :dogs, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create, :show]
  end
end
