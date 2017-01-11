class AddColumnsToVisions < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :username, :string
    add_column :visions, :email, :string
  end
end
