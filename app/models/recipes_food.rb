class RecipesFood < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :recipe
  belongs_to_active_hash :food
end