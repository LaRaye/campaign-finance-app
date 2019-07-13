class CreateContributors < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :category
      t.string :industry_affiliation

      t.timestamps
    end
  end
end
