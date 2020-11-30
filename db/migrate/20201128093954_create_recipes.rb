class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string     :cooking_name, null: false
      t.text       :how_to_cook,  null: false
      t.integer    :genre_id,     null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
