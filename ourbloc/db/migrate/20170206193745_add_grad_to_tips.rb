class AddGradToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :grad, :string
  end
end
