class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :dates
      t.string :type
      t.string :detail1
      t.string :detail2
      t.string :detail3
      t.string :detail4
      t.string :title
      t.string :position
      t.string :location
      t.integer :resume_id
      t.integer :user_id

      t.timestamps
    end
  end
end
