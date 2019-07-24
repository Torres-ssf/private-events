class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      log_in(@user)
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      @user_events = @user.events
      @upcoming_events = @user.attended_events.upcoming
      @past_events = @user.attended_events.past
    else
      redirect_to login_path
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email)
  end
end
