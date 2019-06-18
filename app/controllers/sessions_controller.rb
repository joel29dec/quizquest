class SessionsController < ApplicationController
    def index
        @sessions = Session.all
    end

    def show
        @session = User.find_by(username: params[:username])
    end
end
