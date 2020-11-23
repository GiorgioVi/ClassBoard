# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  vote_count  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  solution_id :integer
#
class Rating < ApplicationRecord
end
