class AddUserName < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string, null: false, limit: 20
  end
end
