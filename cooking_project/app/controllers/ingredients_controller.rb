class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def index
    @ingredients = Ingredient.all
  end

  def edit
    @ingredient = get_ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    end
  end

  def update
    @ingredient = get_ingredient
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path(@ingredient)
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
