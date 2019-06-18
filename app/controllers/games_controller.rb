class GamesController < ApplicationController
    def show
        @session = User.find_by(username: params[:username])
    end
end
