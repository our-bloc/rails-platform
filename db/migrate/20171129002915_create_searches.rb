class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :query
      t.string :category
      t.string :industry
      t.integer :frequency
      t.user_id :integer

      t.timestamps
    end
  end
end
