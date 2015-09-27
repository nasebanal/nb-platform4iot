class ChangeColumnWorkorders < ActiveRecord::Migration
  def change
		remove_column :workorders, :wo_id
		add_column :workorders, :proc_mode, :integer, default: 0
		change_column :workorders, :status, 'integer USING CAST(status AS integer)', default: 0
  end
end
