class AddDetailsToInfluencers < ActiveRecord::Migration[5.0]
  def change
    add_column :influencers, :name, :string
    add_column :influencers, :description, :text

    add_column :influencers, :industry, :string
    add_column :influencers, :style, :string
  end
end
