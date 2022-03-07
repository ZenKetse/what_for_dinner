class ShoppingListsController < ApplicationController
  def show
    default_ingredients = PantryIngredient.where(default: true)
    @shopping_list_ingredients = default_ingredients.map { |ingredient| ingredient unless ingredient.in_stock }
  end
end
