# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :string
#  image_file  :string
#  image_link  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#  user_id     :integer
#
class Question < ApplicationRecord
  belongs_to(:course)

  has_many(:solution)
  
   mount_uploader :image_file, ImageFileUploader
end
