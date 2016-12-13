class CreateVisions < ActiveRecord::Migration[5.0]
  def change
    create_table :visions do |t|
      t.integer :industry
      t.string :ten
      t.string :dreamjob
      t.integer :style

      t.timestamps
    end
  end
end
