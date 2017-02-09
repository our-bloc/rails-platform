class AddPremiumToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :premium, :boolean
  end
end
