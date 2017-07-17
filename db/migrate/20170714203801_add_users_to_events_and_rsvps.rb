class AddUsersToEventsAndRsvps < ActiveRecord::Migration[5.0]
  def change
     add_column :rsvps, :user_id, :integer
    add_index :rsvps, :user_id 
    
     add_column :events, :user_id, :integer
    add_index :events, :user_id 
  end
end
