class Transaction < ApplicationRecord
  has_many :feeder_cow_transactions
  has_many :feeder_cows, through: :feeder_cow_transactions

  belongs_to :company

  enum transaction_type: [:default, :sell]

end
