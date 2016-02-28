class ChangeWaitTimeToSetting < ActiveRecord::Migration
  def change
		change_column :settings, :wait_time, :integer, default: 10
  end
end
