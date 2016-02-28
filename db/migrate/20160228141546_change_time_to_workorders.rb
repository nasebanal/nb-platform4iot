class ChangeTimeToWorkorders < ActiveRecord::Migration
  def change
		change_column :workorders, :obsdate, :time
  end
end
