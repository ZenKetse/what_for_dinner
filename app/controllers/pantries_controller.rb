class PantriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @hide_topnav = true
    @hide_bottomnav = true
    if params[:query].present?
      @pantry_ingredients = current_user.pantry_ingredients.where(ingredient: Ingredient.search_by_name(params[:query]))
    elsif params[:category].present?
      @pantry_ingredients = []
      set_category.each do |categories|
        categories.each do |category|
          Ingredient.all.where(category: category).each do |ingredient|
            unless @pantry_ingredients.include?(current_user.pantry_ingredients.find_by(ingredient: ingredient))
              @pantry_ingredients << current_user.pantry_ingredients.find_by(ingredient: ingredient)
            end
          end
        end
      end
      @pantry_ingredients.uniq.compact
    else
      @pantry_ingredients = current_user.pantry_ingredients
    end
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

  private

  def set_category
    @categories = params[:category].split.map do |category|
      Category.search_by_category(category)
    end
  end
end
