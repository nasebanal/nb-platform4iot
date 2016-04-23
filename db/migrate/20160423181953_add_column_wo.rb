class AddColumnWo < ActiveRecord::Migration
  def change
		add_column :workorders, :alert_flag, :integer, default: '0'
  end
end
