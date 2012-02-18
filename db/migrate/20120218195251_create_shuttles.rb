class CreateShuttles < ActiveRecord::Migration
  def change
    create_table :shuttles do |t|
      t.datetime :departure_time
      t.integer :capacity

      t.timestamps
    end
  end
end
