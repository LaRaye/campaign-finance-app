class AddCandidateToContributions < ActiveRecord::Migration[5.2]
  def change
    add_reference :contributions, :candidate, index: true, foreign_key: true
  end
end
