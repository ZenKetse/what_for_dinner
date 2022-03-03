class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, :instructions, :dish_types, uniqueness: true
  validates :name, :instructions, :dish_types, presence: true
end
