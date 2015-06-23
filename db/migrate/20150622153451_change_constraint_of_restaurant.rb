class ChangeConstraintOfRestaurant < ActiveRecord::Migration
  def change
    change_column_null :restaurants, :registration_date, true
  end
end
