class CreateUserValuations < ActiveRecord::Migration
  def change
    create_table :user_valuations do |t|
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false
      t.integer :purpose, default: 0
      t.integer :price, default: 3
      t.integer :quality, default: 3
      t.integer :service, default: 3
      t.integer :mood, default: 3
      t.integer :cost_performance, default: 3
      t.float :total_score, null: false
      t.timestamps null: false
    end
  end
end
