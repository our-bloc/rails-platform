class AddDetailsToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :resources, :string
    add_column :resources, :industry, :string
    add_column :resources, :company, :string
    add_column :resources, :image, :string
    add_column :resources, :upload, :string
    add_column :resources, :link, :string
    add_column :resources, :prep, :string
    add_column :resources, :type, :string
    add_column :resources, :job_type, :string
    add_column :resources, :style, :string
  end
end
