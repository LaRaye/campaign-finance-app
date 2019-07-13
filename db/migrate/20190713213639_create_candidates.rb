class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :party_affiliation
      t.string :office_position
      t.string :location
      t.string :platform_outline

      t.timestamps
    end
  end
end
