class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def by_user
    @recipes = Recipe.all.where(user_id: @current_user.id)

  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new recipe_params

      @current_user.recipes << recipe
      if recipe.name.present?
        if params[:file].present?
          req = Cloudinary::Uploader.upload(params[:file])
          recipe.image = req["public_id"]
        end

        if params[:recipe][:images].present?
          params[:recipe][:images].each do |image|
            req = Cloudinary::Uploader.upload image
            recipe.images << req["public_id"]
          end
        end

        recipe.save
        redirect_to recipe
      else
        flash[:error] = "Please enter the recipe name"
        render :new
      end



  end

  def edit
    @recipe = Recipe.find params[:id]
    redirect_to root_path unless @current_user.present? && @current_user == @recipe.user
  end


  def show
    @recipe = Recipe.find params[:id]
    @user = @recipe.user
    @rates = @recipe.rates
    @lists = @current_user.lists if @current_user.present?
    @rate_average = nil
    if @rates.any?
      @rate_average = @rates.pluck(:rating).reduce(:+) / @rates.pluck(:rating).size.to_f
    end
    @same_country_recipes = Recipe.all.where(origin: @recipe.origin).sample(3)

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

    if params[:recipe][:images].present?
      recipe.images = []
      params[:recipe][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        recipe.images << req["public_id"]
      end
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
    params.require(:recipe).permit(:name, :prep_time, :prep_time_unit, :cooking_time, :cooking_time_unit, :difficulty, :course, :serving, :content, :image, :origin)
  end
end
