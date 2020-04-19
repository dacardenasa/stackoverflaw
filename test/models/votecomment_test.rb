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

require 'test_helper'

class VotecommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
