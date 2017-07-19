class CreateResidences < ActiveRecord::Migration[5.1]
  def change
    create_table :residences do |t|
      t.string :name
      t.integer :max_capacity

      t.timestamps
    end
  end
end
