class PostsController < ApplicationController
    before_action :check_for_login

  def new
    @post = Post.new
  end

  def create
    post = Post.create post_params
    @current_user.posts << post
    redirect_to root_path
  end

  def show
    @post= Post.find params[:id]
  end

  def edit
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:message, :image, :date)
  end
end
