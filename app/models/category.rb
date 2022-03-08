class Category < ApplicationRecord
  include PgSearch::Model

  has_many :ingredients
  validates :name, presence: true, uniqueness: true

  pg_search_scope :search_by_category,
                  against: :name,
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
