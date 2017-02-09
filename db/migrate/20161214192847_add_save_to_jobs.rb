class AddSaveToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :saved, :boolean 
  end
end
