class GamesController < ApplicationController
    def index
        @games = Game.all
        @category = Category.find_by(id: params[:id])
    end


    def show
      @game = Game.find_by(id: params[:id])
      @category = Category.find_by(id: @game.category_id)
      @current_user = User.find_by(id: session[:user_id])
      @questions = Question.all.select {|q| q.category_id == @category.id}
      @game_questions = @questions.sample(10)
      # @selected_category = @game.create_solo_game(params)
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
        @category = Category.find_by(id: params[:category][:category_id].to_i)
        @questions = Question.all.select {|q| q.category_id == @category.id}
        @game = Game.create(user_id: session[:user_id], category_id: @category.id)
        # byebug
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
