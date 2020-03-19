class SessionController < ApplicationController
  before_action :check_for_login, :only => [:show]

  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id # log the user in
      redirect_to user
    else
      flash[:error] = "Invalid email address or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil # log the user out
    redirect_to login_path
  end
end
