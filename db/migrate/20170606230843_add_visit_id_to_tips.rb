class AddVisitIdToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :visit_id, :integer
  end
end
