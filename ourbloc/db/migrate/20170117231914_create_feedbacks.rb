class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :body
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
