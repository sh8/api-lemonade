class CreateMasterMealTimes < ActiveRecord::Migration
  def change
    create_table :master_meal_times do |t|
      t.string :name
    end
  end
end
