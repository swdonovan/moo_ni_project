class FeederWeight < ApplicationRecord
  belongs_to :feeder_cow

  enum weight_type: [:working, :incoming, :outgoing]
end
