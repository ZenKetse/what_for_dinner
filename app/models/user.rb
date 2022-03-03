class User < ApplicationRecord
  has_one :pantry
  has_one :shopping_list
  has_many :pantry_ingredients, through: :pantry
  has_many :shopping_list_ingredients, through: :shopping_list
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :setup_user

  private

  def setup_user
    Pantry.create(user: self)
    ShoppingList.create(user: self)
  end
end
