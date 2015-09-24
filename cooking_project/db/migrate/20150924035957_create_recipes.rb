class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredient
      t.text :instruction
      t.string :image

      t.timestamps null: false
    end
  end
end
