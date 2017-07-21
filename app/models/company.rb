class Company < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true

  has_many :transactions
end
