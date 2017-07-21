class FeederCow < ApplicationRecord
  has_many :feeder_cow_transactions
  has_many :transactions, through: :feeder_cow_transactions

  belongs_to :residence

  enum life_status: [:alive, :dead]
end
