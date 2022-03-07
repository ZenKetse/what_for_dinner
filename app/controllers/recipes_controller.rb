class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show ingredients]

  def your_index
    @recipes = Recipe.all
    @user_ingredients = current_user.pantry.ingredients
    @user_recipes = []
    @recipes.each do |recipe|
      if (recipe.ingredients - @user_ingredients).empty?
        @user_recipes << recipe
      end
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show; end

  def ingredients
    @pantry_ingredients = @recipe.recipe_ingredients.map do |recipe_ingredient|
      PantryIngredient.find_by(ingredient: recipe_ingredient)
    end
  end

  def favorites_index
    favorited_recipes = current_user.all_favorites
    @recipes = favorited_recipes.map { |recipe| Recipe.find(recipe.favoritable_id) }
  end

  def add_to_favorite
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
