class RemoveColumnDifficultyFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :difficulty
  end
end
