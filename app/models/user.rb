# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  lead                   :boolean
#  name                   :string
#  remember_created_at    :datetime
#  research_group         :string
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  year                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many  :articles, class_name: "Article", foreign_key: "user_id"

  has_many  :rsvps, class_name: "Rsvp", foreign_key: "user_id", dependent: :destroy

  has_many  :comments, class_name: "Comment", foreign_key: "user_id"


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
