class Question < ApplicationRecord
  belongs_to :category
  has_many :game_questions
  has_many :games, through: :game_questions

  def answers
    @answer_choices = []
    temp = self.incorrect_answers

    temp.split(',').each { |answer|
      @answer_choices << answer
    }
    @answer_choices.push(self.correct_answer).shuffle
    # @answer_choices.map {|a| a.scan(/[0-9a-zA-Z ]/).join('')}
  end

  def is_correct?(params)

  end
end
