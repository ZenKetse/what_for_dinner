Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :pantry, only: :show do
    resources :ingredients, only: :index
    resources :pantry_ingredients, only: %i[update create]
    resources :recipes, only: :show
    get '/your-recipes', to: 'recipes#your_index'
  end
end
