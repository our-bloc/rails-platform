class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    # user details on login
    add_column :users, :name, :string
    add_column :users, :school , :string
  	add_column :users, :major , :string
  	add_column :users, :gradyear , :integer
  	add_column :users, :experience, :text 
  	add_column :users, :bloc1, :text 
  	add_column :users, :bloc2, :text
  	add_column :users, :bloc3, :text 


  	
  	
  	#full details for profile
  	add_column :users, :skills, :text
    add_column :users, :orgs , :string
  	add_column :users, :links , :string
  	add_column :users, :threeskills , :integer
  	add_column :users, :phone, :string 
  	add_column :users, :geo, :text  
  	add_column :users, :hometown , :string
  	add_column :users, :company, :string
  	add_column :users, :mission, :text
  	add_column :users, :industry, :text
  	add_column :users, :statement, :string
  	add_column :users, :title, :string 
  	add_column :users, :resumelink, :string
  end
end
