# == Schema Information
#
# Table name: articles
#
#  id             :bigint           not null, primary key
#  article_title  :string
#  article_url    :string
#  comments_count :integer
#  user_caption   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Article < ApplicationRecord
belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

has_many  :comments, class_name: "Comment", foreign_key: "article_id", dependent: :destroy


end
