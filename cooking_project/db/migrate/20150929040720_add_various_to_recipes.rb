class AddVariousToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :publisher, :string
    add_column :recipes, :source_url, :string
    add_column :recipes, :provider_id, :string
    add_column :recipes, :api_provider, :string
  end
end
