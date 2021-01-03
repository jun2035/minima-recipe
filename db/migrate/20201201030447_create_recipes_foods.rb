class CreateRecipesFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes_foods do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :food_id, null: false

      t.timestamps
    end
  end
end