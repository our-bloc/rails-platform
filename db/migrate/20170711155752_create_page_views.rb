class CreatePageViews < ActiveRecord::Migration[5.0]
  def change
    create_table :page_views do |t|
      t.string :user_id
      t.string :referer
      t.string :session
      t.string :ip_address
      t.string :user_agent
      t.string :created_at

      t.timestamps
    end
  end
end
