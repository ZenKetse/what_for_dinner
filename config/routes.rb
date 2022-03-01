Rails.application.routes.draw do
  get 'pantries/show'
  devise_for :users
  root to: 'pages#home'
  resource :pantry, only: :show
end
