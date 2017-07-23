class CalvingCow < ApplicationRecord
  has_many :calves

  belongs_to :residence

  enum life_status: [:alive, :dead]
end
