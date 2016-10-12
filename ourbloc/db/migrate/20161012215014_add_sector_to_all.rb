class AddSectorToAll < ActiveRecord::Migration[5.0]
  def change
    add_column :asks, :sector, :string

    add_column :shares, :sector, :string

    add_column :jobs, :sector, :string

    add_column :resources, :sector, :string
  end
end
