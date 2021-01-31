class ListsController < ApplicationController
  # This model just show up when users log in
  before_action :check_for_login

  def index
    # Just only show up the current_user's lists
    @lists = List.all.where(user_id: @current_user.id)
  end

  def new
    # Create a new blank list
    @list = List.new
  end

  def create
    # Creating new list using strong parameters
    list = List.new list_params
    # check if list title is present
    if list.title.present?
      list.save
      @current_user.lists << list
      redirect_to lists_path
    else
      flash[:error] = "Please name your recipe list."
      render :new
    end
  end

  def add_recipe_to_list
    # Method that add a recipe to a current_user's list
    list = List.find params[:list_id]
    recipe = Recipe.find params[:recipe_id]
    #check if users add a recipe to the same list twice
    if list.recipes.include?(recipe)
      flash[:error] = "You already added this recipe!"
      redirect_to list
    else
      list.recipes << recipe
      list.save
      redirect_to list
    end
  end

  def edit
  end

  def show
    @list = List.find params[:id]
    @recipes = @list.recipes
  end

  def destroy
    list = List.find params[:id]
    list.destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :recipe_id, :list_id)
  end

end
