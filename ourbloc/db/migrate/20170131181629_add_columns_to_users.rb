class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :picture, :string
    add_column :users, :timezone, :string
  end
end
