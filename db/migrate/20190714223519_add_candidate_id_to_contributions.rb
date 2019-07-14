class AddCandidateIdToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :candidate_id, :integer
  end
end
