class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :application_url
      t.date :deadline

      t.timestamps
    end
  end
end
