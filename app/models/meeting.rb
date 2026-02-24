# == Schema Information
#
# Table name: meetings
#
#  id           :bigint           not null, primary key
#  date         :date
#  location     :string
#  meeting_name :string
#  rsvps_count  :integer
#  time         :time
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class Meeting < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id", optional: true

  has_many  :rsvps, class_name: "Rsvp", foreign_key: "meeting_id", dependent: :destroy
end
