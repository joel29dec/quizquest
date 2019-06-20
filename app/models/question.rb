class Question < ApplicationRecord
  belongs_to :category
  has_many :game_questions
  has_many :games, through: :game_questions

  def answers
    @answer_choices = []
    temp = self.incorrect_answers

    temp.split.each { |answer|
      @answer_choices << answer
    }
    @answer_choices.push(self.correct_answer)
    @answer_choices
  end
end
