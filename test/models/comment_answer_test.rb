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

require 'test_helper'

class CommentAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
