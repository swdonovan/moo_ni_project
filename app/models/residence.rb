class Residence < ApplicationRecord
  validates :name, presence: true
  validates :max_capacity, presence: true

  has_many :feeder_cows
  has_many :calving_cows

  enum occupancy: [:empty, :occupied]
end
