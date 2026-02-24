class AddLocationAndUserIdToMeetings < ActiveRecord::Migration[8.0]
  def change
    add_column :meetings, :location, :string
    add_column :meetings, :user_id, :integer
  end
end
