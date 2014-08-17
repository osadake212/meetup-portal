class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :user_id
      t.string :title
      t.string :short_description
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    add_index :meetups, :title
    add_index :meetups, :short_description
    add_index :meetups, :start_date
    add_index :meetups, :end_date
  end
end
