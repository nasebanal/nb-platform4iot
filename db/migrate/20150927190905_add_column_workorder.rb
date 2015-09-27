class AddColumnWorkorder < ActiveRecord::Migration
  def change
		add_column :workorders, :data_set, :string
  end
end
