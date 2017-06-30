class AddUsersToTipsAndInfluencers < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :user_id, :integer
    add_index :tips, :user_id 
    
     add_column :influencers, :user_id, :integer
    add_index :influencers, :user_id 
  end
end
