class CreateMasterSnsTypes < ActiveRecord::Migration
  def change
    create_table :master_sns_types do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
