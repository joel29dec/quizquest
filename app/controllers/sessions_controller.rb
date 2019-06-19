class SessionsController < ApplicationController
    def index
        @sessions = Session.all
        @user = User.new
    end

    def show
        
        @session = User.find_by(username: params[:username])
        redirect_to sessions_path(@sessions)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to sessions_path(@user.username)
        else
            @errors = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
