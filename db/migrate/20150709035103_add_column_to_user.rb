class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo, :string
  end
end
