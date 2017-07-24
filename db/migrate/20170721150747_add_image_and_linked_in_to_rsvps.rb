class AddImageAndLinkedInToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :image, :string
    add_column :rsvps, :linkedin, :string
  end
end
