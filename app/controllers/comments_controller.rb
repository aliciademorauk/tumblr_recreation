class CommentsController < ApplicationController
  before_action :get_post
  before_action :authenticated

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment was successfully added!"
      redirect_to @post
    else
      flash.now[:error] = "There was a problem with your comment. Please try again..."
      render "posts/show", status: :unprocessable_entity 
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment was successfully deleted!"
      redirect_to @post
    else
      flash.now[:error] = "There was a problem with deleting your comment. Please try again..."
      render "posts/show"
    end
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
