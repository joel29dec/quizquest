class UsersController < ApplicationController
  before_action :authorized #before we do anything. check to see if this is the authorized user
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.score = 0
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @current_user = User.find_by(id: session[:user_id])
    @highscores = User.all[0..4].sort {|a, b| b.score <=> a.score }.map{ |user| [user.username, user.score] }
  end

  private

  def authorized
    if !current_user
      #if the user is not authrorized then redirect them to sign in
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
