class RemoveSectorFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :sector, :string
    add_column :jobs, :deadline, :date_field
  end
end
