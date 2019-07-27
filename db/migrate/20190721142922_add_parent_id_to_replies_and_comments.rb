class AddParentIdToRepliesAndComments < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :parent_id, :integer
    add_column :comments, :parent_id, :integer
  end
end
