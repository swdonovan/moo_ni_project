class Calf < ApplicationRecord
  validates :tag_number, presence: true

  belongs_to :calving_cow

end
