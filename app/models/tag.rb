# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :integer
#
class Tag < ApplicationRecord

  belongs_to :job, required: true, class_name: "Job", foreign_key: "job_id"

end
