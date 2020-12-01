class RecipesController < ApplicationController
  before_action :set_recipe, except: [:index, :new, :create, :search]
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    end
  
  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @recipes = Recipe.search(params[:keyword]).order("created_at DESC")
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  
  def recipe_params
    params.require(:recipe).permit(:image, :cooking_name, :how_to_cook, :genre_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
