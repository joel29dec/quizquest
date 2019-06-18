class AddColumnTypeToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :type, :string
  end
end
