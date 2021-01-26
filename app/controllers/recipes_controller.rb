class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new recipe_params
    
  end

  def edit
  end

  def show
    @recipe = Recipe.find params[:id]
    @user = @recipe.user
  end
end
