class IngredientController < ApplicationController
  before_action :authenticate_user!
  def new
    @ingredient = Ingredient.new
  end

  def index
    @ingredients = Ingredient.all
    # binding.pry
  end

  def edit
    @ingredient = get_ingredient
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

  def update
    @ingredient = get_ingredient
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path(@ingredients)
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def get_ingredient
    Ingredient.find(params[:id])
  end

end
