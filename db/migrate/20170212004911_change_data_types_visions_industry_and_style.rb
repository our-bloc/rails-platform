class ChangeDataTypesVisionsIndustryAndStyle < ActiveRecord::Migration[5.0]
  def up
    change_column :visions, :industry, :string
    change_column :visions, :style, :string

  end

  def down
    change_column :visions, :industry, :integer
    change_column :visions, :style, :integer
  end
end
