class AddDateToWorkorders < ActiveRecord::Migration
  def change
		add_column :workorders, :obsdate, :datetime
  end
end
