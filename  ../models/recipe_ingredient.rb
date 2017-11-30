class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :ingredient_id, presence: true
  validates :quantity, presence: true
end
