class RemoveLatituteFromEndLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :end_locations, :latitute, :float
  end
end
