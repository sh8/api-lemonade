class AddColumnToMasterGenre < ActiveRecord::Migration
  def change
    add_column :master_genres, :foursquare_id, :string
    add_column :restaurants, :foursquare_id, :string
  end
end
