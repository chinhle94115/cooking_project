class RecipesController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def create

    # ingredient_list = "eggs,butter,sugar"
    api_url = "food2fork.com/api/search.json"
    api_key = "4fdc8cf04236d404b86477fc16b9cf50"
    full_url = "#{api_url}?q=#{ingredient_list}&key=#{api_key}"
    response = Typhoeus.get(full_url)
    @recipes = JSON.parse(response.body)["recipes"]

    # @ingredients = Ingredient.new(ingredient_params)
    # if @ingredients.save
    #   redirect_to ingredients_path
    # end
  end
  
  def ingredient_list
    all_ingredients = Ingredient.all.pluck(:name)
    all_given_ingredients = params.keys & all_ingredients
    all_given_ingredients.join(",")
  end

end
