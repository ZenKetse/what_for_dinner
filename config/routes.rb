Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :pantry, only: %i[show update destroy] do
    resources :ingredients, only: :index
    resources :pantry_ingredients, only: %i[update create]
    resources :recipes, only: %i[show index]
    resources :shopping_lists, only: :show
    get '/your-recipes', to: 'recipes#your_index'
    get '/recipe-ingredients/:id', to: 'recipes#ingredients', as: 'recipe-ingredients'
  end
  resources :pantry_ingredients, only: :destroy
end
