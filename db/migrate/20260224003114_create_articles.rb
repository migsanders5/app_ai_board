class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :article_url
      t.string :article_title
      t.integer :user_id
      t.string :user_caption
      t.integer :comments_count

      t.timestamps
    end
  end
end
