Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'

  resources :personalized_trainers do
    resources :bookings, only: [:create, :update, :edit]
  end

  get 'dashboard', to: 'dashboards#index'
  resources :bookings, only: [] do 
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
