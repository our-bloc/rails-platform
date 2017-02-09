class AddPrepToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :prep, :string
  end
end
