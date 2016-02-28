class AddStatusIdToWorkorders < ActiveRecord::Migration
  def change
    add_column :workorders, :status_id, :integer
		remove_column :workorders, :status
  end
end
