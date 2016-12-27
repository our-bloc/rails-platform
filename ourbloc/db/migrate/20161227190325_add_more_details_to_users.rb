class AddMoreDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstjob, :string
    add_column :users, :prep, :string
    add_column :users, :style, :string
    add_column :users, :gradschool, :string
    add_column :users, :office, :string
    add_column :users, :companies, :string
  end
end