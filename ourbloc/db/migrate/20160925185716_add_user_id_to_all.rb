class AddUserIdToAll < ActiveRecord::Migration[5.0]
  def change
    add_column :asks, :user_id, :integer
    add_index :asks, :user_id
    
    add_column :shares, :user_id, :integer
    add_index :shares, :user_id
    
    add_column :jobs, :user_id, :integer
    add_index :jobs, :user_id
    
    add_column :sectors, :user_id, :integer
    add_index :sectors, :user_id
  end
end
