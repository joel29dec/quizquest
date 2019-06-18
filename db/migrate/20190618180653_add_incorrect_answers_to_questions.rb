class AddIncorrectAnswersToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :incorrect_answers, :text
  end
end
