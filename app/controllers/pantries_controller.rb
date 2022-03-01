class PantriesController < ApplicationController
  def show
    @pantry_ingredients = current_user.pantry_ingredients
  end
end
