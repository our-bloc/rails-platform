class AddLoginTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :login_bypass_token , :string
  end
end
