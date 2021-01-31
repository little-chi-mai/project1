class CommentsController < ApplicationController
  def index
  end

  def create
    recipe = Recipe.find params[:recipe_id]
    comment = recipe.comments.new comment_params
    @current_user.comments << comment
    recipe.comments << comment
    comment.save

    redirect_to recipe
  end

  def new
  end

  def edit
  end

  def show
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_back fallback_location: root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
