class CreatePantryIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :pantry_ingredients do |t|
      t.references :pantry, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.boolean :in_stock
      t.boolean :default

      t.timestamps
    end
  end
end
