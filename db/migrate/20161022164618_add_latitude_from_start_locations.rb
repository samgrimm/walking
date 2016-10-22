class AddLatitudeFromStartLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :start_locations, :latitude, :float
  end
end
