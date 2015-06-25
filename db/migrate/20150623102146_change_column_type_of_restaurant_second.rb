class ChangeColumnTypeOfRestaurantSecond < ActiveRecord::Migration
  def change
    change_column :restaurants, :lat, :decimal, :precision => 9, :scale => 6
    change_column :restaurants, :lon, :decimal, :precision => 9, :scale => 6
  end
end
