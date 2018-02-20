class AddLogoToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :logo, :string
  end
end
