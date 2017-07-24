class AddContactInfoToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps , :email , :string
    add_column :rsvps , :name , :string
  
  end
end
