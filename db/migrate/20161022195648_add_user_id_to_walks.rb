class AddUserIdToWalks < ActiveRecord::Migration[5.0]
  def change
    add_column :walks, :user_id, :integer
  end
end
