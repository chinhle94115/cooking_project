class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  # before_action :set_recipe

  def create
    if Favorite.save(favorited: @recipe, user: current_user)
      redirect_to favorites_path, notice: 'Recipe has been favorited'
    else
      redirect_to favorites_path, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @precipe.source_url, user_id: current_user.id).first.destroy
    redirect_to favorites_path, notice: 'Recipe is no longer in favorites'
  end

  private

  def set_recipe

    @recipe = Recipe.find(params[:source_url] || params[:id])
  end
end
