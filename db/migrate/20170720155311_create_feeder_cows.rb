class CreateFeederCows < ActiveRecord::Migration[5.1]
  def change
    create_table :feeder_cows do |t|
      t.integer :tag_number
      t.references :residence, foreign_key: true

      t.timestamps
    end
  end
end
