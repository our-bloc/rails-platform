class AddFirstjobToVisions < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :firstjob, :string
  end
end
