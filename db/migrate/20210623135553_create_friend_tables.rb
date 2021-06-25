class CreateFriendTables < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_tables do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age

      t.timestamps
    end
  end
end
