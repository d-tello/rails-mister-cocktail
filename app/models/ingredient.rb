class Ingredient < ApplicationRecord
  # Associations
  has_many :doses
  # Validations
  validates :name, uniqueness: true
  validates :name, presence: true
end
