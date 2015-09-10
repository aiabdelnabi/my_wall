class AddIndexOnStatusId < ActiveRecord::Migration
  def change
  	add_index :comments, :status_id
  end
end