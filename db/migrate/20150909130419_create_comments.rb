class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :status
      t.timestamps null: false
    end
  end
end
