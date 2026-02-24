# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer
#  user_id    :integer
#
class Comment < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"


  belongs_to :article, required: true, class_name: "Article", foreign_key: "article_id", counter_cache: true

end
