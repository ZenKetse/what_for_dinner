class Ingredient < ApplicationRecord
  include PgSearch::Model

  belongs_to :category
  has_many :pantry_ingredients
  has_many :categories
  has_many :recipes, through: :pantry_ingredients
  validates :name, presence: true, uniqueness: true

  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
