class ChangeTimeToDatetime < ActiveRecord::Migration
  def change
		remove_column :workorders, :obstime
		add_column :workorders, :obstime, :datetime
  end
end
