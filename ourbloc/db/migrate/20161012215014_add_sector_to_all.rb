class AddSectorToAll < ActiveRecord::Migration[5.0]
  def change
    add_column :asks, :sector, :string, default: ""

    add_column :shares, :sector, :string, default: ""

    add_column :jobs, :sector, :string, default: ""

    add_column :resources, :sector, :string, default: ""
  end
end
