# == Schema Information
#
# Table name: meetings
#
#  id           :bigint           not null, primary key
#  date         :date
#  meeting_name :string
#  rsvps_count  :integer
#  time         :time
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Meeting < ApplicationRecord
  has_many  :rsvps, class_name: "Rsvp", foreign_key: "meeting_id", dependent: :destroy

end
