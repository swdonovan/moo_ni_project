class FeederCow < ApplicationRecord
  has_many :feeder_cow_transactions
  has_many :ranch_transactions, through: :feeder_cow_transactions

  has_many :feeder_weights

  belongs_to :residence

  enum life_status: [:alive, :dead]


def all_max_weight_cows
  
end


private

  def group_all_weights_as_objects
    @all_grouped = FeederCow.joins(:feeder_weights).group_by(&:feeder_weights)
  end
end
