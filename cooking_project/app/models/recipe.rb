# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  title       :string
#  ingredient  :string
#  instruction :text
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ActiveRecord::Base
end
