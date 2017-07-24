class AddUsersToEventsAndRsvps < ActiveRecord::Migration[5.0]
  def change
     add_column :rsvps, :user_id, :integer
    add_index :rsvps, :user_id 
    
    
  end
end
