class AddCalvingCowColumnToCalves < ActiveRecord::Migration[5.1]
  def change
    add_reference :calves, :calving_cow, foreign_key: true
  end
end
