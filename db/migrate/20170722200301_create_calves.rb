class CreateCalves < ActiveRecord::Migration[5.1]
  def change
    create_table :calves do |t|
      t.integer :tag_number
      t.string :description

      t.timestamps
    end
  end
end
