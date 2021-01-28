class ListsController < ApplicationController
  before_action :check_for_login


  def index
    @lists = List.all.where(user_id: @current_user.id)
  end

  def new
    @list = List.new
  end

  def create
    list = List.new list_params
    if list.title.present?
      list.save
      @current_user.lists << list
      redirect_to lists_path
    else
      flash[:error] = "Please name your recipe list."
      render new
    end
  end

  def add_recipe_to_list
    list = List.find params[:list_id]
    recipe = Recipe.find params[:recipe_id]
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
