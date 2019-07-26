class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      log_in(user)
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
