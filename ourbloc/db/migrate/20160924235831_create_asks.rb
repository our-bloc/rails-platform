class CreateAsks < ActiveRecord::Migration[5.0]
  def change
    create_table :asks do |t|

      t.timestamps
    end
  end
end
