class PantryIngredientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    params[:ingredients].each do |ingredient|
      @ingredient = Ingredient.find(ingredient)
      @pantry_ingredient = PantryIngredient.new(ingredient_id: ingredient, in_stock: true, default: true)
      @pantry_ingredient.pantry = current_user.pantry
      @pantry_ingredient.save!
    end

    respond_to do |format|
      format.html
      format.text { render partial: "ingredients/ingredient_card", locals: { ingredient: @ingredient }, formats: [:html] }
    end
  end

  def update
    @pantry = current_user.pantry
  end

  def destroy
    @pantry_ingredient = PantryIngredient.find(params[:id]).destroy
  end
end
