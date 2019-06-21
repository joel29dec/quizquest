class GamesController < ApplicationController
    def index
        @games = Game.all
        @category = Category.find_by(id: params[:id])
        @current_user = User.find_by(id: session[:user_id])
    end


    def show
      @game = Game.find_by(id: params[:id])
      @category = Category.find_by(id: @game.category_id)
      @current_user = User.find_by(id: session[:user_id])
      @questions = Question.all.select {|q| q.category_id == @category.id.to_i}
      @game_questions = @questions.sample(1)
      @current_user.question_asked = @game_questions[0].id.to_i
      @current_user.save
    end

    def user_responses
        @current_user = User.find_by(id: session[:user_id])
        @correct_answer = Question.find_by(id: @current_user.question_asked).correct_answer
        @game = Game.find_by(user_id: @current_user.id)
        if params[@correct_answer]
          @current_user.score ? @current_user.score += 1 : @current_user.score = 0
          @current_user.save
          redirect_to game_path(@game.id)
        else
          redirect_to lose_path
        end
    end

    def lose
      @current_user = User.find_by(id: session[:user_id])
      @current_user.score -= 10
      @current_user.save
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
        redirect_to game_path(@game.id)
      elsif params["Create"] == "Create Question"
        redirect_to new_question_path
      end
    end

end
