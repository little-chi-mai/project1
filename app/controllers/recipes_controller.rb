class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new recipe_params
    country = Country.find params[:recipe][:country_id]

    if recipe.name.present?

      @current_user.recipes << recipe
      country.recipes << recipe

      if params[:file].present?
        req = Cloudinary::Uploader.upload(params[:file])
        recipe.image = req["public_id"]
      end
      recipe.save
      redirect_to recipe
    else
      flash[:error] = "Please enter the name of your recipe."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def show
    @recipe = Recipe.find params[:id]
    @user = @recipe.user
    @same_country_recipes = Recipe.all.where(country_id: @recipe.country_id).sample(3)

    if @recipe.course.present?
      @same_course_recipes = Recipe.all.where(course: @recipe.course).sample(3)
    end

  end

  def update
    recipe = Recipe.find params[:id]
    #Cloudinary
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      recipe.image = req["public_id"]
    end
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
