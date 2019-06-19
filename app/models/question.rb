class Question < ApplicationRecord
    belongs_to :category
    has_many :game_questions
    has_many :games, through: :game_questions

    def initialize(question_index = 0)
        
    end

    def shuffle_answers
        temp = self.incorrect_answers
        temp.match?(/[A-Z]/i).scan(/\w+/)
        puts "=====================#{updated_at}========================="
        p temp
        p temp.class
        return temp
    end
    # attr_accessor :category_id, :prompt, :correct_answer, :incorrect_answers

    # def initialize(question_params)
    #   @category_id = Category.find_or_create_by(name: question_params["category"])
    #   @prompt = question_params["question"]
    #   @correct_answer = question_params["correct_answer"]
    #   @incorrect_answers = question_params["incorrect_answers"]
    # end


    # def question_params
    #   params.permit(:category, :question, :correct_answer, :incorrect_answers)
    # end
end
