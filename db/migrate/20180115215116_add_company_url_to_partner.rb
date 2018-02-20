class AddCompanyUrlToPartner < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :companyurl , :string
  end
end
