class ChangeVisionsColumnTypes < ActiveRecord::Migration[5.0]
  def change
    change_column :visions, :gradschool, :string
    change_column :visions, :companies, :string    


    
  end
end
