class RanchTransaction < ApplicationRecord
  has_many :feeder_cow_transactions
  has_many :feeder_cows, through: :feeder_cow_transactions

  has_many :calving_cow_transactions
  has_many :calving_cows, through: :calving_cow_transactions

  belongs_to :company

  enum transaction_type: [:purchase, :sell]
end
