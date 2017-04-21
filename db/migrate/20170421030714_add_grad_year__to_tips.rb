class AddGradYearToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :gradyear, :string
  end
end
