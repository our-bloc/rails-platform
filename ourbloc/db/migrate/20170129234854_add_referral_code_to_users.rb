class AddReferralCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :refererred_by_user_id, :integer
  end
end
