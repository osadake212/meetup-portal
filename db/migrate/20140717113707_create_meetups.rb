class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :user_id
      t.string :title
      t.string :short_description
      t.text :description
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end

    add_index :meetups, :title
    add_index :meetups, :short_description
    add_index :meetups, :date
    add_index :meetups, :start_time
    add_index :meetups, :end_time
  end
end
