require "byebug"
class IngredientsController < ApplicationController
  def index
    if params[:query].present?
      @all_ingredients = Ingredient.search_by_name(params[:query])
    else
      @all_ingredients = Ingredient.all
    end
    @not_have_ingredients = (@all_ingredients - current_user.pantry.ingredients)
  end
end
