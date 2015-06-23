class AddColumnToBusinessDays < ActiveRecord::Migration
  def change
    add_column :business_days, :restaurant_id, :integer
  end
end
