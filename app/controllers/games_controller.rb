class GamesController < ApplicationController
    def index
        @games = Game.all
        @category = Category.find_by(id: params[:id])
    end


    def show
      @questions = Question.all
       @game = Game.find_by(id: params[:id])
       @category = Category.find_by(id: params[:id])
       @current_user = User.find_by(id: session[:user_id])
       @selected_category = @game.create_solo_game(game_params)
    end

    def lobby
      @username = params[:username]
    end

    def new
      @questions = Question.all
      Game.new
    end

    def create

      if params["Create"] == "Start Game"
        @questions = Question.select {|q| q.category_id == params[:category][:category_id].to_i}
        byebug
        @game = Game.create(user_id: session[:user_id], category_id: game_params)
        redirect_to game_path(@game.id)
      elsif params["Create"] == "Create Game"
        redirect_to new_game_path
      end

    end

     private

     def game_params
        params.require(:category).permit(:category_id)
    end
end
