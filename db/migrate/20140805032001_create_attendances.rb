class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :meetup_id

      t.timestamps
    end

    add_index :attendances, :user_id
    add_index :attendances, :meetup_id
    add_index :attendances, [:user_id, :meetup_id], unique: true
  end
end
