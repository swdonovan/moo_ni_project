class CreateCalvingCowWeights < ActiveRecord::Migration[5.1]
  def change
    create_table :calving_cow_weights do |t|
      t.references :calving_cow, foreign_key: true
      t.integer :weight
      t.integer :weight_type

      t.timestamps
    end
  end
end
