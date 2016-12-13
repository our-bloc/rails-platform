class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.integer :whoserve
      t.integer :howserve
      t.string :legacy

      t.timestamps
    end
  end
end
