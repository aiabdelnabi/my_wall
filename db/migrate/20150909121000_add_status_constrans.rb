class AddStatusConstrans < ActiveRecord::Migration
  def change
  	change_column :statuses, :title, :string, null: false, limit: 50
  	change_column :statuses, :content, :text, null: false, limit: 500
  end
end
