class ChangeRecipeIngredientsAmountColumnToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :recipe_ingredients, :amount, :float
  end
end
