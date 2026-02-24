class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
