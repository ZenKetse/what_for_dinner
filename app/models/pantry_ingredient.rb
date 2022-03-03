class PantryIngredient < ApplicationRecord
  belongs_to :pantry
  belongs_to :ingredient
  has_many :users, through: :pantry
  validates :pantry_id, :ingredient_id, :in_stock, :default, presence: true
end
