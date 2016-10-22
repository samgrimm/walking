class CreateStartLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :start_locations do |t|
      t.string :address
      t.float :latitute
      t.float :longitude
      t.integer :walk_id

      t.timestamps
    end
  end
end
