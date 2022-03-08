class ShoppingListsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_ingredient, except: :show

  def show
    default_ingredients = PantryIngredient.where(default: true)
    @shopping_list_ingredients = default_ingredients.map { |ingredient| ingredient unless ingredient.in_stock }
  end

  def update
    @shopping_list_ingredient.update!(in_stock: true)
  end

  def destroy
    @shopping_list_ingredient.destroy
  end

  private

  def set_ingredient
    @shopping_list_ingredient = PantryIngredient.find(params[:shopping_list]['id'])
  end
end
