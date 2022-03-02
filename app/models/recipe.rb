class Recipe < ApplicationRecord
  validates :name, :instructions, :dish_types, uniqueness: true
  validates :name, :instructions, :dish_types, presence: true
end
