class Ingredient < ApplicationRecord
  belongs_to :category
  has_many :pantry_ingredients
  has_many :recipes, through: :pantry_ingredients
  validates :name, presence: true, uniqueness: true
end
