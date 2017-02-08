class RemoveSectorFromJobs < ActiveRecord::Migration[5.0]
  def change
    
    add_column :jobs, :deadline, :date
  end
end
