class AddSizeToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :size, :string
  end
end
