class CalvingCow < ApplicationRecord
  has_many :calfs

  belongs_to :residence

  enum life_status: [:alive, :dead]
end
