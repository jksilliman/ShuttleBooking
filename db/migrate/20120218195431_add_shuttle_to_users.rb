class AddShuttleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shuttle_id, :integer
    add_index :users, :shuttle_id
  end
end
