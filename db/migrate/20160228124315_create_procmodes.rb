class CreateProcmodes < ActiveRecord::Migration
  def change
    create_table :procmodes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
