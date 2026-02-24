# == Schema Information
#
# Table name: jobs
#
#  id              :bigint           not null, primary key
#  application_url :string
#  company         :string
#  deadline        :date
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Job < ApplicationRecord
  has_many  :tags, class_name: "Tag", foreign_key: "job_id", dependent: :destroy

end
