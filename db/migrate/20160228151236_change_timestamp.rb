class ChangeTimestamp < ActiveRecord::Migration
  def change
		remove_column :workorders, :obstime
		add_column :workorders, :obstime, :timestamp
  end
end
