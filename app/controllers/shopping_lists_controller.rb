class ShoppingListsController < ApplicationController
  def show
    @shopping_list_ingredients = PantryIngredient.where(default: true)
    @shopping_list_ingredients.map { |ingredient| ingredient unless ingredient.in_stock }
  end
end
