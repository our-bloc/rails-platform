class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :sector, foreign_key: true
      t.text :title
      t.string :description
      t.string :text

      t.timestamps
    end
  end
end
