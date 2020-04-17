# == Schema Information
#
# Table name: pregunta
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class PreguntumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
