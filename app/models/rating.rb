# == Schema Information
#
# Table name: ratings
#
#  id                 :integer          not null, primary key
#  vote_count         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  solution_id        :integer
#  solution_poster_id :integer
#  user_id            :integer
#
class Rating < ApplicationRecord
  belongs_to(:solution)

end
