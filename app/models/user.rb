# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  has_many :votecomments
  has_many :answers
  has_many :voteanswers
  
  has_many :CommentAnswers
  # Verificar si esta asociacion es correcta
  has_many :answers, through: :CommentAnswers

  has_many :preguntums, through: :comments
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, format: /@/
  validates :password, presence: true, on: :create
  validates :password, length: { in: 6..20 }, allow_nil: true

end
