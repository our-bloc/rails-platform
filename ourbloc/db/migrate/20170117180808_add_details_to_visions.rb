class AddDetailsToVisions < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :gender, :string
    add_column :visions, :timezone, :string
    add_column :visions, :age, :string
  end
end
