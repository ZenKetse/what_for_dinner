class PantryIngredientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    ingredient = Ingredient.find(params[:id])
    @pantry_ingredient = PantryIngredient.new(ingredient: ingredient, in_stock: true, default: true)
    @pantry_ingredient.pantry = current_user.pantry
    @pantry_ingredient.save!

    respond_to do |format|
      format.html
      format.text { render partial: "ingredients/ingredient_card", locals: { ingredient: ingredient }, formats: [:html] }
    end
  end

  def update
    @pantry = current_user.pantry
  end
end
