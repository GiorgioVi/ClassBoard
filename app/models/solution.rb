# == Schema Information
#
# Table name: solutions
#
#  id          :integer          not null, primary key
#  description :string
#  image_file  :string
#  image_link  :string
#  vote_count  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#  question_id :integer
#  user_id     :integer
#
class Solution < ApplicationRecord
  belongs_to(:question)

  mount_uploader :image_link, ImageLinkUploader

end
