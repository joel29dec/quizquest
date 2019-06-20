class AddColumnCategoryIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :category_id, :integer
  end
end
