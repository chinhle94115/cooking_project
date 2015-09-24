# == Schema Information
#
# Table name: refrigerators
#
#  id         :integer          not null, primary key
#  ingredient :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Refrigerator < ActiveRecord::Base
end
