class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.integer :job_id
      t.string :tag

      t.timestamps
    end
  end
end
