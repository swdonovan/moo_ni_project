class FeederCowTransaction < ApplicationRecord
  belongs_to :transaction
  belongs_to :feeder_cow
end
