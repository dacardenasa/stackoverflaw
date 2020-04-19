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
  has_many :voteanswers

  validates :body, presence: true

  # Method  to validate vote
  def voted_by?(user)
    voteanswers.exists?(user: user)
  end

end
