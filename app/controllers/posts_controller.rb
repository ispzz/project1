class PostsController < ApplicationController
    before_action :check_for_login

  def new
    @post = Post.new
  end

  def create
    post = Post.create post_params
    @current_user.posts << post
    redirect_to post
  end

  def show
    @post= Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update post_params
    redirect_to post
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to user_path(@current_user)
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:message, :image, :date)
  end
end
