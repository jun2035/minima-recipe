class Food < ApplicationRecord
  has_many :recipes_foods
  has_many :recipes, through: :recipes_foods
end
