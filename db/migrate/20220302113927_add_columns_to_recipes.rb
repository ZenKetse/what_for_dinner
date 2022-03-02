class AddColumnsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :dish_types, :string
    add_column :recipes, :instructions, :text
  end
end
