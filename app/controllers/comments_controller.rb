class CommentsController < ApplicationController
  def index
  end

  def create
    recipe = Recipe.find params[:recipe_id]
    comment = recipe.comments.new
    comment.user_id = @current_user.id
    comment.save(comment_params)

    redirect_to :new
  end

  def new
  end

  def edit
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:content)

  end
end
