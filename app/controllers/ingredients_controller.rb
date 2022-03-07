class IngredientsController < ApplicationController
  def index
    if params[:query].present?
      @all_ingredients = Ingredient.search_by_name(params[:query])
    else
      @all_ingredients = Ingredient.all
    end
    @not_have_ingredients = (@all_ingredients - current_user.pantry.ingredients)
    @not_have_ingredients.each do |ingredient|
      @ingredient = ingredient
    end
    respond_to do |format|
      format.html
      format.text { render partial: "ingredients/ingredient_card", locals: { ingredient: @ingredient }, formats: [:html] }
    end
  end
end
