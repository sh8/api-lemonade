class AddSnsColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :sns_type, :integer
    add_column :users, :uid, :string
  end
end
