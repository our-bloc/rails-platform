class AddUserIdToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :user_id, :integer
    add_index :resources, :user_id
  end
end
