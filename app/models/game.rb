class Game < ApplicationRecord
    has_many :user_games
    has_many :game_questions
    has_many :users, through: :user_games
    has_many :questions, through: :game_questions
    belongs_to :user
    # belongs_to :category

    def create_solo_game(params)
      @category = Category.find_by(id: params[:id])
      @questions = Question.select {|q| q.category_id == @category.id}
      @questions.sample(10)
    end


end
