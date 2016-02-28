class AddColumnUserIdToWorkorders < ActiveRecord::Migration
  def change
		add_column :workorders, :creator_id, :integer
		remove_column :workorders, :creator
  end
end
