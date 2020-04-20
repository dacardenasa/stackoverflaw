# == Schema Information
#
# Table name: comment_answers
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :body, presence: true

end
