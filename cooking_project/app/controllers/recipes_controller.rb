class RecipesController < ApplicationController
  def new
  end

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def create
    @recipes = Recipe.get_recipes(params)
    redirect_to recipes_path
  end

  def ingredient_list

  end

end
