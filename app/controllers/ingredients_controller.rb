require "byebug"
class IngredientsController < ApplicationController
  def index
    @all_ingredients = Ingredient.all
    @not_have_ingredients = (@all_ingredients - current_user.pantry.ingredients)
  end
end
