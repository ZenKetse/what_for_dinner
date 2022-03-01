class CreatePantries < ActiveRecord::Migration[6.1]
  def change
    create_table :pantries do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
