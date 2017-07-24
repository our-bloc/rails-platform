class AddEventIdToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :event_id, :integer
    add_index :rsvps, :event_id 
  end
end
