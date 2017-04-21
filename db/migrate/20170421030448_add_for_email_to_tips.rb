class AddForEmailToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :for_email, :boolean
  end
end
