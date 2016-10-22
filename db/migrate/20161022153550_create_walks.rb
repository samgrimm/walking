class CreateWalks < ActiveRecord::Migration[5.0]
  def change
    create_table :walks do |t|
      t.string :start_address
      t.string :end_address
      t.boolean :fatalities
      t.boolean :crime

      t.timestamps
    end
  end
end
