class AddProfileUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profileurl, :string
  end
end
