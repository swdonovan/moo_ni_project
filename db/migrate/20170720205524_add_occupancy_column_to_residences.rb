class AddOccupancyColumnToResidences < ActiveRecord::Migration[5.1]
  def change
    add_column :residences, :occupancy, :integer, default: 0
  end
end
