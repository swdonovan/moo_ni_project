class CalvingCowWeight < ApplicationRecord
  belongs_to :calving_cow

  enum weight_type: [:working, :incoming, :outgoing]
end
