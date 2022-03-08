class Recipe < ApplicationRecord
  acts_as_favoritable
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, :instructions, uniqueness: true
  validates :name, :instructions, :dish_types, presence: true
end
