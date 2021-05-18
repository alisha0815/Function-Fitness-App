Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'

  # roots to personal trainers show page 
  get "/personalized_trainers/:id", to: "personalized_trainers#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
