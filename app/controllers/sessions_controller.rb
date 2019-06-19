class SessionsController < ApplicationController
    def index
        @sessions = Session.all
      #  @user = User.new
    end

    def show
        
        @session = User.find_by(username: params[:username])
        redirect_to sessions_path(@sessions)
    end

    def new
    end
  
    def create
      if params["authenticate"] == "signup"
        @user = User.new(user_params)
        @user.save
        redirect_to lobby_path(:username => @user.username)
      elsif params["authenticate"] == "login"
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            #so we don't know if this will work yet
            redirect_to lobby_path(:username => user.username)
        # else
        #   @errors = user.errors.full_messages
        end    
      end
    end

    private
    def user_params
        params.permit(:username, :password)
    end
end
