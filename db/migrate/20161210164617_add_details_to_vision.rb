class AddDetailsToVision < ActiveRecord::Migration[5.0]
  def change
    
    #new details for vision
    add_column :visions, :mentor, :string
    add_column :visions, :gradschool, :integer 
    
    
    #new details for values
    add_column :values, :moves, :integer
    add_column :values, :drama, :integer
    add_column :values, :office, :integer
  end
end
