class CreateVisions < ActiveRecord::Migration[5.0]
  def change
    create_table :visions do |t|
      t.string :industry
      t.string :ten
      t.string :dreamjob
      t.text :style

      t.timestamps
    end
  end
end
