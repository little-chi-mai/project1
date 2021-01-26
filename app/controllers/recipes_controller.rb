class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new recipe_params

    if @recipe.name.present?
      @recipe.save
      @current_user.recipes << @recipe
      redirect_to recipe
    else
      flash[:error] = "Please enter the name of your recipe."
      render new
    end
  end

  def edit
  end

  def show
    @recipe = Recipe.find params[:id]
    @user = @recipe.user
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :prep_time, :prep_time_unit, :cooking_time, :cooking_time_unit, :difficulty, :course, :serving, :content, :image)
  end
end
