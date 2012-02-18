class AddDestinationToShuttles < ActiveRecord::Migration
  def change
    add_column :shuttles, :destination, :string
  end
end
