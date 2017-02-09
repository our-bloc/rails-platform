class AddMajorToVisions < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :major, :string
  end
end
