class Session < ApplicationRecord
    belongs_to :user

    def show
        # @session = Session.find_by(id: params[:id])
        @session = User.find_by(username: params[:username])
    end
end

