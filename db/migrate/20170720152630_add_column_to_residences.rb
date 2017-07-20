class AddColumnToResidences < ActiveRecord::Migration[5.1]
  def change
    add_column :residences, :image_path, :string
  end
end
