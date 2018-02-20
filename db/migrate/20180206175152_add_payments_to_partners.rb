class AddPaymentsToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :end_date, :date
    add_column :partners, :coupon, :string
    add_column :partners, :customer_id, :string
  end
end
