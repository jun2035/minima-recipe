require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    user = FactoryBot.create(:user)
    @recipe = FactoryBot.build(:recipe, user_id: user.id)
  end

  describe 'レシピ新規登録' do
    context 'レシピ登録がうまくいくとき' do
      it '「image、cooking_name、how_to_cook」が存在し、「genre_id」が初期値(0)以外を選択され、「food_id」が2つ選択されていれば、登録できる' do
        expect(@recipe).to be_valid
      end
    end

    context 'レシピ登録がうまくいかないとき' do
      it 'imageが空では、登録できない' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Image can't be blank")
      end
      it 'cooking_nameが空では、登録できない' do
        @recipe.cooking_name = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Cooking name can't be blank")
      end
      it 'how_to_cookが空では、登録できない' do
        @recipe.how_to_cook = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("How to cook can't be blank")
      end
      it 'genre_idが初期値(0)のままでは、登録できない' do
        @recipe.genre_id = 0
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('Genre Select')
      end
      it 'food_idが未選択では、登録できない' do
        # @recipe.food_ids = nil
        #@recipe.recipes_foods.food_ids = nil
        @recipe.recipes_foods[0].food_id = nil
        @recipe.recipes_foods[1].food_id = nil
        binding.pry
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('食材は2個選択してください。')
      end
    end
  end
end