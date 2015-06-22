class CreateBusinessHours < ActiveRecord::Migration
  def change
    create_table :business_hours do |t|
      t.string :start, null: false
      t.string :end, null: false
      t.integer :business_day_id, null: false
      t.timestamps null: false
    end
  end
end
