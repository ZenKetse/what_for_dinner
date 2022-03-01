class Pantry < ApplicationRecord
  belongs_to :user
  has_many :pantry_ingredients
end
