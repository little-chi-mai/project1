class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @brand = Brand.new
  end

  def new
    @recipe = Recipe.new
    @brand = Brand.new
  end

  def create
    recipe = Recipe.new recipe_params
    country = Country.find params[:recipe][:country_id]

    if recipe.name.present?
      @current_user.recipes << recipe
      country.recipes << recipe
      recipe.save
      redirect_to recipe
    else
      flash[:error] = "Please enter the name of your recipe."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find params[:id]
    @brand = Brand.new
  end

  def show
    @recipe = Recipe.find params[:id]
    @user = @recipe.user
    @brand = Brand.new
  end

  def update
    recipe = Recipe.find params[:id]
    recipe.update recipe_params
    redirect_to recipe
  end

  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :prep_time, :prep_time_unit, :cooking_time, :cooking_time_unit, :difficulty, :course, :serving, :content, :image)
  end
end
