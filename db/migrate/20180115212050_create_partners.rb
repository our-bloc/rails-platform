class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :company
      t.string :admin_name
      t.string :sponsors
      t.string :color
      t.string :banner
      t.string :quote
      t.string :location
      t.string :demo
      t.string :location
      t.string :email 
      t.string :gender
      t.string :plan

      t.timestamps
    end
  end
end
