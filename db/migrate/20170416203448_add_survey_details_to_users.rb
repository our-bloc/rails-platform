class AddSurveyDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :career_services, :string
    add_column :users, :linkedin, :string
  end
end
