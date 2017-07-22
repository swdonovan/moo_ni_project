class CalvingCowTransaction < ApplicationRecord
  belongs_to :ranch_transaction
  belongs_to :calving_cow

end
