class AddPhoneNumberToResumes < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :phone, :string
  end
end
