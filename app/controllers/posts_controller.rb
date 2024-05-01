class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
end
