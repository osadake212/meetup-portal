class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :format
      t.date :date
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
