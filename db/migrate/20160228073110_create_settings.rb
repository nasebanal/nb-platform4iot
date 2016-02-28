class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.integer :wait_time

      t.timestamps null: false
    end

		add_index :settings, :user_id
  end
end
