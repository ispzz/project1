class PostsController < ApplicationController
    before_action :check_for_login

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      @current_user.posts << @post
      if params[:file].present?
        req = Cloudinary::Uploader.upload(params[:file])
        @post.image = req["public_id"]
        @post.save
      end
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]

  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      post.image = req["public_id"]
    end
    post.update_attributes(post_params)
    post.save
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
    params.require(:post).permit(:message, :date)
  end
end
