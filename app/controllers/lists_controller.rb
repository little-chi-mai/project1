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

    list.recipes << recipe
    list.save
    redirect_to list
  end

  def edit
  end

  def show
    @list = List.find params[:id]
    @recipes = @list.recipes

  end

  private
  def list_params
    params.require(:list).permit(:title, :recipe_id)
  end

end
