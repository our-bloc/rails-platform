class CreateTips < ActiveRecord::Migration[5.0]
  def change
    create_table :tips do |t|
      t.string :title
      t.text :body
      t.string :industry
      t.string :link

      t.timestamps
    end
  end
end
