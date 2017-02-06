class AddPollToQuizes < ActiveRecord::Migration[5.0]
  def change
    add_column :visions, :career_services, :string
    add_column :visions, :linkedin, :string
  end
end
