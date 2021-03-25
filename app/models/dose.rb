class Dose < ApplicationRecord
  # Associations
  belongs_to :cocktail
  belongs_to :ingredient
  # Validations
  validates :description, presence: true
  validates_uniqueness_of :cocktail_id, scope: [:ingredient_id]
end
