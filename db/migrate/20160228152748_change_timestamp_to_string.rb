class ChangeTimestampToString < ActiveRecord::Migration
  def change
		remove_column :workorders, :obstime
		add_column :workorders, :obstime, :string
  end
end
