class AddUserIdToFriendTables < ActiveRecord::Migration[6.1]
  def change
    add_column :friend_tables, :user_id, :integer
    add_index :friend_tables, :user_id
  end
end
