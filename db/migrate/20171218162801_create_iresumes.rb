class CreateIresumes < ActiveRecord::Migration[5.0]
  def change
    create_table :iresumes do |t|
      t.string :name
      t.text :body
      t.text :description
      t.string :location
      t.text :bio

      t.timestamps
    end
  end
end
