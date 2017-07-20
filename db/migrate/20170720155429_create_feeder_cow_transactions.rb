class CreateFeederCowTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :feeder_cow_transactions do |t|
      t.references :transaction, foreign_key: true
      t.references :feeder_cow, foreign_key: true

      t.timestamps
    end
  end
end
