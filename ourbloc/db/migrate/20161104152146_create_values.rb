class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.text :whoserve
      t.text :howserve
      t.text :legacy

      t.timestamps
    end
  end
end
