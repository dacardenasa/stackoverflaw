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

class Preguntum < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :users, through: :comments
  # Validations 
  validates :title, :body, presence: true
end
