class RemoveColumnAnswerFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :answer
  end
end
