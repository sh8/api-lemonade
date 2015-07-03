class CreateUserSnsTypes < ActiveRecord::Migration
  def change
    create_table :user_sns_types do |t|
      t.integer :master_sns_type_id
      t.integer :user_id
      t.string :access_token
      t.timestamps null: false
    end
  end
end
