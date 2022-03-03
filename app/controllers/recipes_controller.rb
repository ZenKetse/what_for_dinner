class RecipesController < ApplicationController
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
end
