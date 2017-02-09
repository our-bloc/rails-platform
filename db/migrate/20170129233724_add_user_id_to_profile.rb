class AddUserIdToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :user_id , :integer
    add_index :profiles, :user_id 

  end
end
