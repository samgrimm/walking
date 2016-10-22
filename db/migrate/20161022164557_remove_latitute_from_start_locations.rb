class RemoveLatituteFromStartLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :start_locations, :latitute, :float
  end
end
