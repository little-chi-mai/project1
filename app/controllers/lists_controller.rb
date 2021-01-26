class ListsController < ApplicationController
  before_action :check_for_login

  def index

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

  def edit
  end

  def show
    @list = List.find params[:id]
    @recipe_names = @list.recipes.pluck :name

  end

  private
  def list_params
    params.require(:list).permit(:title)
  end

end
