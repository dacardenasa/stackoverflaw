# == Schema Information
#
# Table name: votecomments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  preguntum_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Votecomment < ApplicationRecord
  belongs_to :user
  belongs_to :preguntum
end
