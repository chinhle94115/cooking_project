class CreateRefrigerators < ActiveRecord::Migration
  def change
    create_table :refrigerators do |t|
      t.string :ingredient

      t.timestamps null: false
    end
  end
end
