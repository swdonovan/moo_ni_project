class CalvingCow < ApplicationRecord
  belongs_to :residence

  enum life_status: [:alive, :dead]
end
