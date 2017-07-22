class CreateFeederWeights < ActiveRecord::Migration[5.1]
  def change
    create_table :feeder_weights do |t|
      t.references :feeder_cow, foreign_key: true
      t.integer :weight
      t.integer :weight_type, default: 0

      t.timestamps
    end
  end
end
