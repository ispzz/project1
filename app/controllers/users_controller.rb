class UsersController < ApplicationController
  before_action :check_for_login, :only => [:show]

  def show
    @user = User.find params[:id]
    @posts = Post.all # POSTS IN CALENDAR
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
        redirect_to @user
      else
        render :new
      end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      user.image = req["public_id"]
    end
    user.update_attributes(user_params)
    user.save
    redirect_to user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :image)
  end
end
