class AddDetailsToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps , :role , :string
    add_column :rsvps , :current_job , :string
    add_column :rsvps , :company , :string
    add_column :rsvps , :promotion , :string
    add_column :rsvps , :promotion_link , :string
    add_column :rsvps , :tip , :string
    add_column :rsvps , :tip_link , :string
  end
end
