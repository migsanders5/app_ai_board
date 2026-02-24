# == Schema Information
#
# Table name: rsvps
#
#  id         :bigint           not null, primary key
#  going      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :integer
#  user_id    :integer
#
class Rsvp < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :meeting, required: true, class_name: "Meeting", foreign_key: "meeting_id", counter_cache: true

  
end
