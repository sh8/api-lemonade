class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :screen_name, null: false
      t.integer :sex, null: false, default: 0
      t.date :birthday
      t.integer :average_cost
      t.integer :type, default: 0
      t.integer :status, default: 0
      t.timestamps null: false
    end
  end
end
