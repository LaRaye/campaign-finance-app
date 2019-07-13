class AddFavoritesCountToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :favorite_counter, :integer
  end
end
