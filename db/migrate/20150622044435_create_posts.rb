class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null:false
      t.string :photo_url
      t.timestamps null: false
    end
  end
end
