class AddLatitudeFromEndLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :end_locations, :latitude, :float
  end
end
