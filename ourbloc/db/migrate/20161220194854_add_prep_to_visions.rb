class AddPrepToVisions < ActiveRecord::Migration[5.0]
  def change
      add_column :visions, :prep, :string
  end
end
