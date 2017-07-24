class CalvingCow < ApplicationRecord
  has_many :calves
  has_many :calving_cow_weights

  belongs_to :residence

  enum life_status: [:alive, :dead]
end
