class AddColumnToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :country, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :cc, :string
  end
end
