class AddProfilePicToVisions < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :image, :string
  end
end
