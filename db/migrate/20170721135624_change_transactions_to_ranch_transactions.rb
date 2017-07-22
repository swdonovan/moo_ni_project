class ChangeTransactionsToRanchTransactions < ActiveRecord::Migration[5.1]
  def change
    rename_table :transactions, :ranch_transactions
  end
end
