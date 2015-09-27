class AddColumnWorkorders < ActiveRecord::Migration
  def change
		add_column :workorders, :wo_id, :integer
		add_column :workorders, :status, :string
		add_column :workorders, :creator, :string
  end
end
