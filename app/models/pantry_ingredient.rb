class PantryIngredient < ApplicationRecord
  include PgSearch::Model

  belongs_to :pantry
  belongs_to :ingredient
  has_many :users, through: :pantry
  validates :pantry_id, :ingredient_id, :in_stock, :default, presence: true

  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
