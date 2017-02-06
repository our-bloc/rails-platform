class AddSchoolToVisions < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :school, :string
  end
end
