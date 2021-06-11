class AddWriterIdToGossips < ActiveRecord::Migration[6.1]
  def change
    add_reference :gossips, :user, foreign_key: true
    change_column :gossips, :user_id, :integer, null:false
  end
end
