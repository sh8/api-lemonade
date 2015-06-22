class CreateMasterGenres < ActiveRecord::Migration
  def change
    create_table :master_genres do |t|
      t.string :name, null: false
    end
  end
end
