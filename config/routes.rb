Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :pantry, only: :show do
    resources :ingredients, only: :index
  end
end
