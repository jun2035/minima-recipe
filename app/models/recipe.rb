class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :genre
  has_one_attached :image
  belongs_to :user
  # has_many :recipes_foods
  # has_many :foods, through: :recipes_foods
  # has_many :favorites
  # has_many :comments

  with_options presence: true do
    validates :image
    validates :cooking_name
    validates :how_to_cook
  end
  
  validates :genre_id, numericality: { other_than: 0 } 

end
