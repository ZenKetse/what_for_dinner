Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :pantry, only: %i[show update destroy] do
    resources :ingredients, only: :index
    resources :pantry_ingredients, only: %i[update create]
    resources :recipes, only: %i[show index]
    resources :shopping_lists, only: :show
    patch '/pantry/shopping_lists/:id', only: :update, as: 'update-shopping-list'
    get '/your-recipes', to: 'recipes#your_index'
    get '/recipe-ingredients/:id', to: 'recipes#ingredients', as: 'recipe-ingredients'
    get '/cookbook', to: 'recipes#favorites_index'
    post '/cookbook/favorite/:recipe_id', to: 'recipes#add_to_favorite', as: 'favorite-recipe'
    post '/cookbook/unfavorite/:recipe_id', to: 'recipes#remove_from_favorite', as: 'unfavorite-recipe'
  end
  resources :pantry_ingredients, only: :destroy
  resources :shopping_lists, only: :destroy
end
