class AddUserIdToVisionValue < ActiveRecord::Migration[5.0]
  def change
    
    add_column :values, :user_id, :integer
    add_index :values, :user_id 
    
    add_column :visions, :user_id, :integer
    add_index :visions, :user_id 
  end
end
