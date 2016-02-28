class ChangeObsdateToWorkorders < ActiveRecord::Migration
  def change
		remove_column :workorders, :obsdate
		add_column :workorders, :obstime, :time
  end
end
