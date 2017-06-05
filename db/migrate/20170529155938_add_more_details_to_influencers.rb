class AddMoreDetailsToInfluencers < ActiveRecord::Migration[5.0]
  def change
    add_column :influencers, :image, :string
    add_column :influencers, :school, :string
    add_column :influencers, :major, :string
    add_column :influencers, :experience, :array
    add_column :influencers, :extra, :array
    add_column :influencers, :grad, :string
    add_column :influencers, :grad_gradyear, :string
    add_column :influencers, :gradyear, :string
    add_column :influencers, :advice1, :string
    add_column :influencers, :advice2, :string
    add_column :influencers, :advice3, :string
    add_column :influencers, :advice4, :string
    add_column :influencers, :resources, :array
  end
end
