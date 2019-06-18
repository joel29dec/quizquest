class Question < ApplicationRecord
    belongs_to :category
    has_many :game_questions
    has_many :games, through: :game_questions
end

