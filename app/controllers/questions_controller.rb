class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    # @category = Category.find_by(id: question_params[:category][:category_id].to_i)
    @question = Question.new(question_params)
    @question.category_id = 100
    if @question.save
      redirect_to games_path
    else
      @errors = @question.erorrs.full_messages
      render :new
    end
  end

  def question_params
    params.require(:question).permit(:prompt, :correct_answer, :category, :incorrect_answers => [])
  end

end
