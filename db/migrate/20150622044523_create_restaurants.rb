class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :ruby
      t.decimal :lat, :precision => 9, :scale => 6, null: false
      t.decimal :lon, :precision => 9, :scale => 6, null: false
      t.integer :master_genre_id, null: false
      t.date :registration_date, null: false
      t.string :address
      t.string :tel
      t.text :remarks
      t.timestamps null: false
    end
  end
end
