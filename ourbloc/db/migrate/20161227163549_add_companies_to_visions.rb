class AddCompaniesToVisions < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :companies, :string
  end
end
