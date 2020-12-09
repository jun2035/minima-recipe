class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :genre
  has_one_attached :image
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
  has_many :foods, through: :recipes_foods
  # has_many :favorites
  # has_many :comments

  with_options presence: true do
    validates :image
    validates :cooking_name
    validates :how_to_cook
  end

  validates :genre_id, numericality: { other_than: 0 } 
  validates_acceptance_of  :recipes_foods, :food_id, length: { minimum: 2, message: 'を1つ以上選択してください' }


  # def self.search(search)
  #   if search != ""
  #     Recipe.where('cooking_name LIKE(?)', "%#{search}%")
  #     Recipe.joins(recipes_foods: :food).where('name LIKE(?)', "%#{search}%")
  #   else
  #     Recipe.all
  #   end
  # end

end
