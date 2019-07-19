class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      # redirect_to show_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def users_params
    params.require(:user).permit(:name, :email)
  end
end
