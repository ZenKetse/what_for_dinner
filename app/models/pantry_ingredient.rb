class PantryIngredient < ApplicationRecord
  belongs_to :pantry
  belongs_to :ingredient
  has_many :users, through: :pantry
end
