class CreateFriendShips < ActiveRecord::Migration
  def change
    create_table :friend_ships do |t|
      t.integer :follow_user_id, null: false
      t.integer :followed_user_id, null: false
      t.boolean :is_approved, null: false, default: false
      t.timestamps null: false
    end
  end
end
