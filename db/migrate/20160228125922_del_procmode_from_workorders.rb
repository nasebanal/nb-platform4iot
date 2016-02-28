class DelProcmodeFromWorkorders < ActiveRecord::Migration
  def change
		remove_column :workorders, :proc_mode
  end
end
