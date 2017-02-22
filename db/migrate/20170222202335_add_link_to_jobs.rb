class AddLinkToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :link, :string
  end
end
