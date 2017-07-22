class Calf < ApplicationRecord
  validate :tag_number, presence: true

  belongs_to :calving_date
  belongs_to :cavling_cow, through: :calving_date
  
end
