class FeederCow < ApplicationRecord
  has_many :feeder_cow_transactions
  has_many :ranch_transactions, through: :feeder_cow_transactions

  has_many :feeder_weights

  belongs_to :residence

  enum life_status: [:alive, :dead]
end
