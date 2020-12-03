json.extract! recipes_food, :id, :recipe_id, :food_id, :created_at, :updated_at
json.url recipes_food_url(recipes_food, format: :json)
