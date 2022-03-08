class PantriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @hide_topnav = true
    @hide_bottomnav = true
    @pantry_ingredients = current_user.pantry_ingredients
    respond_to do |format|
      format.html
      format.text { render partial: "pantries/show_ingredient_card", locals: { pantry_ingredient: pantry_ingredient }, formats: [:html] }
    end
  end

  def update
    @pantry = current_user.pantry
  end

  def destroy
    @pantry_ingredient = PantryIngredient.find(params[:id]).destroy
  end
end
