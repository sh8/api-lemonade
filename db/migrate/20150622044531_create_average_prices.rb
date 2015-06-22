class CreateAveragePrices < ActiveRecord::Migration
  def change
    create_table :average_prices do |t|
      t.integer :price
      t.integer :master_meal_time_id
      t.integer :restaurant_id
      t.timestamps null: false
    end
  end
end
