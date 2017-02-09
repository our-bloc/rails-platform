class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :org
      t.date :date
      t.string :user_id
      t.string :contact
      t.string :industry
      t.text :body
      t.string :social

      t.timestamps
    end
  end
end
