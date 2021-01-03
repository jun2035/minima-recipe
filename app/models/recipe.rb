class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :genre
  has_one_attached :image
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
  has_many :foods, through: :recipes_foods
  # has_many :favorites   #追加実装予定
  # has_many :comments    #追加実装予定

  with_options presence: true do
    validates :image
    validates :cooking_name
    validates :how_to_cook
  end

  validates :genre_id, numericality: { other_than: 0, message: 'Select' } 
  validate :valid_search_count

  # def self.search(search)
  #   if search != ""
  #     Recipe.where('cooking_name LIKE(?)', "%#{search}%")
  #     Recipe.joins(recipes_foods: :food).where('name LIKE(?)', "%#{search}%")
  #   else
  #     Recipe.all
  #   end
  # end

  def self.search(recipes, foods)
    return recipes if foods.blank?

    food_ids = Food.where(name: foods).pluck(:id)

    recipes.select do |r|
      (r.recipes_foods.pluck(:food_id) & food_ids).size >= 2
    end
  end

  def valid_search_count
    if recipes_foods.size != 2
      errors.add(:base, '食材は2個選択してください。')
    end
  end

end
