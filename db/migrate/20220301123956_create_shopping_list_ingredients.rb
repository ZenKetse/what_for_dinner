class CreateShoppingListIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_list_ingredients do |t|
      t.references :shopping_list, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.boolean :bought

      t.timestamps
    end
  end
end
