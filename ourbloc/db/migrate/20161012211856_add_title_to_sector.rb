class AddTitleToSector < ActiveRecord::Migration[5.0]
  def change
    add_column :sectors, :title, :string
  end
end
