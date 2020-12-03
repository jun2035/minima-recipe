require "application_system_test_case"

class RecipesFoodsTest < ApplicationSystemTestCase
  setup do
    @recipes_food = recipes_foods(:one)
  end

  test "visiting the index" do
    visit recipes_foods_url
    assert_selector "h1", text: "Recipes Foods"
  end

  test "creating a Recipes food" do
    visit recipes_foods_url
    click_on "New Recipes Food"

    fill_in "Food", with: @recipes_food.food_id
    fill_in "Recipe", with: @recipes_food.recipe_id
    click_on "Create Recipes food"

    assert_text "Recipes food was successfully created"
    click_on "Back"
  end

  test "updating a Recipes food" do
    visit recipes_foods_url
    click_on "Edit", match: :first

    fill_in "Food", with: @recipes_food.food_id
    fill_in "Recipe", with: @recipes_food.recipe_id
    click_on "Update Recipes food"

    assert_text "Recipes food was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipes food" do
    visit recipes_foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipes food was successfully destroyed"
  end
end
