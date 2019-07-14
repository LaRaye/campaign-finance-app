class AddContributorIdToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :contributor_id, :integer
  end
end
