class AddDetailsToAsks < ActiveRecord::Migration[5.0]
  def change
    add_column :asks , :title, :string
    add_column :asks, :body , :text
    
    
    add_column :shares , :title, :string
    add_column :shares, :body , :text
    
    add_column :jobs , :title, :string
    add_column :jobs, :description , :text
    add_column :jobs, :deadline, :date
    

  end
end
