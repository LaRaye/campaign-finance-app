class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :candidates, :favorite_counter, :favorites_count
  end
end
