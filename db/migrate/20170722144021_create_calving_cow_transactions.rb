class CreateCalvingCowTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :calving_cow_transactions do |t|
      t.references :ranch_transaction, foreign_key: true
      t.references :calving_cow, foreign_key: true

      t.timestamps
    end
  end
end
