class ChangeCreatorIdToWorkorders < ActiveRecord::Migration
  def change
		add_column :workorders, :user_id, :integer
		remove_column :workorders, :creator_id
		add_index :workorders, :user_id
  end
end
