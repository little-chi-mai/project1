class RatesController < ApplicationController
  ### COMING SOON
  def index
  end

  def new
  end

  def edit
  end

  def create
    recipe = Recipe.find params[:recipe_id]
    rate = recipe.rates.new rate_params
    @current_user.rates << rate
    recipe.rates << rate
    comment.save

    redirect_back fallback_location: root_path

  end

  def show
  end

  private
  def rate_params
    params.require(:rate).permit(:rating)
  end
end
