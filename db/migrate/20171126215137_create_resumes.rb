class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :public
      t.string :school
      t.string :type
      t.string :languageskills
      t.string :computerskills
      t.string :activities
      t.string :interests

      t.timestamps
    end
  end
end
