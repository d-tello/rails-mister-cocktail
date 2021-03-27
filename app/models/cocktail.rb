class Cocktail < ApplicationRecord
  # Associations
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  # Validations
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :photo, presence: true
end
