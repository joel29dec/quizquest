class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.string :answer
      t.string :correct_answer
      t.integer :category_id


      t.timestamps
    end
  end
end
