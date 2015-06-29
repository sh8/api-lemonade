class AddIndexToRestaurant < ActiveRecord::Migration
  def change
    add_index :restaurants, :name
    add_index :restaurants, :lat
    add_index :restaurants, :lon
    add_index :restaurants, :foursquare_id
  end
end
