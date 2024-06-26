class PostsController < ApplicationController
  before_action :get_post, except: [:index, :new, :create]
  before_action :authenticated, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post was successfully published!"
      redirect_to root_path
    else
      flash.now[:error] = "There was a problem with your post. Please try again..."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new(post: @post)
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated!"
      redirect_to root_path
    else
      flash.now[:error] = "There was a problem with your post. Please try again..."
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = "Post was successfully deleted."
    redirect_to root_path
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end