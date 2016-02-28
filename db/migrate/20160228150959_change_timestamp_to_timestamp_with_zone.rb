class ChangeTimestampToTimestampWithZone < ActiveRecord::Migration
  def change
		remove_column :workorders, :obstime
		add_column :workorders, :obstime, 'timestamp with time zone'
  end
end
