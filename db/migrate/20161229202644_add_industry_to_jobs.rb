class AddIndustryToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :industry, :string
  end
end
