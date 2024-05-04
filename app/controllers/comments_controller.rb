class CommentsController < ApplicationController
  before_action :get_post

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment was successfully added!"
      redirect_to @post
    else
      flash.now[:error] = "There was a problem with your comment. Please try again..."
      render "posts/show"
    end
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :body)
  end

end
