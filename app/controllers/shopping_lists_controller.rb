class ShoppingListsController < ApplicationController
  def show
    @shopping_list_ingredients = PantryIngredient.where(in_stock: false)
  end
end
