# == Schema Information
#
# Table name: voteanswers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  answer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Voteanswer < ApplicationRecord
  belongs_to :user
  belongs_to :answer
end


