class AddCardTokenToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps , :card_token , :string
  end
end
