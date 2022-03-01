class User < ApplicationRecord
  has_one :pantry
  has_many :pantry_ingredients, through: :pantry
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
