class AddCompanyToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :company, :string
  end
end
