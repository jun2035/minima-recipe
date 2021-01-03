FactoryBot.define do
  factory :recipe do
    cooking_name { '料理名' }
    how_to_cook  { '作り方の説明' }
    genre_id     { 1 }
    association :user 

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
      recipe.recipes_foods.new(food_id: Food.find_by(name: '牛ひき肉').id)
      recipe.recipes_foods.new(food_id: Food.find_by(name: 'たまねぎ').id)
    end

  end
end
