class AddContributorToContributions < ActiveRecord::Migration[5.2]
  def change
    add_reference :contributions, :contributor, index: true, foreign_key: true
  end
end
