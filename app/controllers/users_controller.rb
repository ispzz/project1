class UsersController < ApplicationController
  before_action :check_for_login, :only => [:show]

  def show
    @user = User.find params[:id]
    @posts = Post.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["public_id"]
    end
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :image)
  end
end
