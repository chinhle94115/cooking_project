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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # #if you want to make the username an email (if case user forgets password)
  # before_save { self.username = username.downcase }
  # validates :username, presence: true
  # #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :password, presence: true,
  #                   #format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }
  # has_secure_password


end
