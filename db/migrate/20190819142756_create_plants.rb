class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.string :instructions
      t.string :daily_price
      t.string :image
      t.string :danger_level
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
