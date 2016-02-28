class AddColumnToWorkorders < ActiveRecord::Migration
  def change
		add_column :workorders, :procmode_id, :integer, default: 0
		add_index :workorders, :procmode_id
  end
end
