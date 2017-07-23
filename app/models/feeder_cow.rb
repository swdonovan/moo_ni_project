class FeederCow < ApplicationRecord
  has_many :feeder_cow_transactions
  has_many :ranch_transactions, through: :feeder_cow_transactions

  has_many :feeder_weights

  belongs_to :residence

  enum life_status: [:alive, :dead]


  def weight_gain
    @all.group(:id).
  end

  def self.percent_find(weights)
    difference = ((weights.working.last.weight) - (weights.incoming.first.weight))
    percent = (difference.to_f / weights.incoming.first.weight.to_f)
  end
end
