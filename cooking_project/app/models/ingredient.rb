# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ActiveRecord::Base

  def self.ingredient_list(params)
    all_ingredients = Ingredient.all.pluck(:name)
    all_given_ingredients = params.keys & all_ingredients
    all_given_ingredients.join(",")
  end

  def self.get_recipes(params)
    ingredients = ingredient_list(params)
    api_url = "food2fork.com/api/search.json"
    api_key = "4fdc8cf04236d404b86477fc16b9cf50"
    full_url = "#{api_url}?q=#{ingredients}&key=#{api_key}"
    response = Typhoeus.get(full_url)
    recipes = JSON.parse(response.body)["recipes"]
    return recipes
  end
end
