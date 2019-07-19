class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      log_in(@user)
      redirect_to show_path
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to login_path
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email)
  end
end
