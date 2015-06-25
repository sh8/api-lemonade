class ChangeColumnTypeOfRestaurant < ActiveRecord::Migration
  def change
    change_column :restaurants, :lat, :float
    change_column :restaurants, :lon, :float
  end
end
