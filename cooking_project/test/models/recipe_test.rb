# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  title        :string
#  ingredient   :string
#  instruction  :text
#  image        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  publisher    :string
#  source_url   :string
#  provider_id  :string
#  api_provider :string
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
