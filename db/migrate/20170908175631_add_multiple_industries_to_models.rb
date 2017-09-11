class AddMultipleIndustriesToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :industry2 , :string 
    add_column :tips, :industry2, :string 
    add_column :users, :industry2, :string
    
    add_column :jobs, :industry3 , :string
    add_column :tips, :industry3, :string
    add_column :users , :industry3, :string
# figuring out why this migration is not pushing 
  end
end
