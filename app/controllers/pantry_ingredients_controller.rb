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
    if params[:pantry_ingredient][:id].class == Array
      params[:pantry_ingredient][:id].each do |pantry_ingredient_id|
        @pantry_ingredient = PantryIngredient.find(pantry_ingredient_id)
        @pantry_ingredient.default = true
        @pantry_ingredient.update(in_stock: true)
      end
    else
      @pantry_ingredient = PantryIngredient.find(params[:pantry_ingredient][:id])
      @pantry_ingredient.default = true
      @pantry_ingredient.update(in_stock: false)
    end
  end

  def destroy
    @pantry_ingredient = PantryIngredient.find(params[:id]).destroy
  end
end
