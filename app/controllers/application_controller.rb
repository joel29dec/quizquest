class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :is_authorized

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


  def logged_in?
    current_user != true
  end

  def is_authorized
    redirect_to new_user_path if !current_user
  end

end
