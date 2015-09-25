# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  #if you want to make the username an email (if case user forgets password)
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.username = username.downcase }
  validates :username, presence :true
                      #format: { with: VALID_EMAIL_REGEX }
                       uniqueness: { case_sensitive: false }
  validates :password, presence :true
  has_secure_password

  
end
