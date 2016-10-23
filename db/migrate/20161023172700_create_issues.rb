class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.float :lat
      t.float :lng
      t.string :description
      t.string :category
      t.string :icon

      t.timestamps
    end
  end
end
