class AddVisitIdToInfluencers < ActiveRecord::Migration[5.0]
  def change
    add_column :influencers, :visit_id, :integer
  end
end
