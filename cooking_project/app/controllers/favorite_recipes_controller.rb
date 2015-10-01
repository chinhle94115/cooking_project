class FavoriteRecipesController < ApplicationController

  before_action :set_recipe

  def create
    if Favorite.create(favorited: @recipe, user: current_user)
      redirect_to favorite_recipes_index_path, notice: 'Project has been favorited'
    else
      redirect_to favorite_recipes_index_path, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @recipe.source_url, user_id: current_user.id).first.destroy
    redirect_to favorite_recipes_index_path, notice: 'Project is no longer in favorites'
  end

  def show
  end

  def index
  end

  private

  def set_project
    @project = Project.find(params[:source_url] || params[:id])
  end
  
end
