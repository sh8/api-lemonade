class CreateBusinessDays < ActiveRecord::Migration
  def change
    create_table :business_days do |t|
      t.integer :day, null: false
      t.timestamps null: false
    end
  end
end
