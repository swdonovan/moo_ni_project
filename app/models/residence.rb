class Residence < ApplicationRecord
  validates :name, presence: true
  validates :max_capacity, presence: true 
end
