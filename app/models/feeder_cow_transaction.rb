class FeederCowTransaction < ApplicationRecord
  belongs_to :feeder_cow
  belongs_to :ranch_transaction
end
