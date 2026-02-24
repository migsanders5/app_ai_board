class CreateMeetings < ActiveRecord::Migration[8.0]
  def change
    create_table :meetings do |t|
      t.date :date
      t.time :time
      t.string :meeting_name
      t.integer :rsvps_count

      t.timestamps
    end
  end
end
