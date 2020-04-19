# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  preguntum_id :integer
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :preguntum

  validates :body, presence: true

end
