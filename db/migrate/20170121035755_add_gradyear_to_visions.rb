class AddGradyearToVisions < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :gradyear, :integer
  end
end
