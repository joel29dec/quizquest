class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ["Invalid username/password combination."]
      render :new
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

end
