class CreateWorkorders < ActiveRecord::Migration
  def change
    create_table :workorders do |t|

      t.timestamps null: false
    end
  end
end
