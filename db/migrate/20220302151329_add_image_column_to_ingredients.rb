class AddImageColumnToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :image, :string
  end
end
