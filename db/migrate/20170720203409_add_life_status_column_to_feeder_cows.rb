class AddLifeStatusColumnToFeederCows < ActiveRecord::Migration[5.1]
  def change
    add_column :feeder_cows, :life_status, :integer, default: 0 
  end
end
