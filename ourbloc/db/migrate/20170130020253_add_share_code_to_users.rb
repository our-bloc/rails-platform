class AddShareCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :referral_code , :string
  end
end
