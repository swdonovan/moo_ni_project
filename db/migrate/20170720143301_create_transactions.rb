class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :company, foreign_key: true
      t.date :date
      t.decimal :amount
      t.integer :transaction_type, default: 0

      t.timestamps
    end
  end
end
