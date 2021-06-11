class RemoveContentFromGossips < ActiveRecord::Migration[6.1]
  def change
    remove_column :gossips, :content, :text
  end
end
