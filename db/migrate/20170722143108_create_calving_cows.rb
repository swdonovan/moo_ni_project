class CreateCalvingCows < ActiveRecord::Migration[5.1]
  def change
    create_table :calving_cows do |t|
      t.integer :tag_number
      t.references :residence, foreign_key: true
      t.integer :life_status

      t.timestamps
    end
  end
end
