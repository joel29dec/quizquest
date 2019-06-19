class GamesController < ApplicationController
    def index
        @games = Game.all
        @category = Category.find_by(id: params[:id])
    end


     def show
       @game = Game.find_by(id: params[:id])
       @category
    end

     def new
        Game.new
    end

    def create
        # @category = Category.find_by(id: params[:category_id]).questions
        p params
        
        if params["Create"] == "Start Game"
          @questions = Question.find_by(category_id: params[:category_id])
          @game = Game.create
          redirect_to game_path(@game.id)
        elsif params["Create"] == "Create Game"
          redirect_to new_game_path
        end

    end







     private



     def game_params
        params.require(:category).require(:category_id)
        # params.require(:game).require(:game_id, :game_key)
    end
end










#   def show
#         @game = Game.find_by(id: params[:game_id])
#         @category = @game.category
#         #@question = @category.questions[1]
#         # @game = Game.find_by(id: params[:game_id])
#         # @category = Category.find_by(id: params[:category_id])
#         # @user = User.find_by(id: params[:user_id])
#         # @question = Question.find_by
#         # #@question = Question.find_by(id: params[:category_id].first) #change this out to a random place
#         # p @question.prompt
#     end	   
#      def new
#         Game.new
#     end
#     def create 
#           @category = Category.find_by(id: params[:category][:category_id].to_i)
#          p "*******************************"
#          p @category.questions
#          p
#         # @category_questions = @category.questions
#         p "*******************************"
#         # p params
#         #  p @ca÷stions = Question.find_by(category_id: params[:category_id])
#         # p @questions