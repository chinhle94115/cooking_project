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

validates_uniqueness_of :name

  def self.ingredient_list(params)
    all_ingredients = Ingredient.all.pluck(:name)
    all_given_ingredients = params.keys & all_ingredients
    ingredient_list = all_given_ingredients.join(",")
    return ingredient_list

  end


end
