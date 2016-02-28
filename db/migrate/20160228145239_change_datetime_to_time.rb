class ChangeDatetimeToTime < ActiveRecord::Migration
  def change
		remove_column :workorders, :obstime
		add_column :workorders, :obstime, :time
  end
end
