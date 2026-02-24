class CreateRsvps < ActiveRecord::Migration[8.0]
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :meeting_id
      t.boolean :going

      t.timestamps
    end
  end
end
