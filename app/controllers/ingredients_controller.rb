class IngredientsController < ApplicationController
  def index
    if params[:query].present?
      @all_ingredients = Ingredient.search_by_name(params[:query])
    elsif params[:category].present?
      @all_ingredients = []
      set_category.each do |categories|
        categories.each do |category|
          Ingredient.all.where(category: category).each do |ingredient|
            @all_ingredients << ingredient
          end
        end
      end
      @all_ingredients = @all_ingredients.uniq
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

  private

  def set_category
    @categories = params[:category].split.map do |category|
      Category.search_by_category(category)
    end
  end
end
