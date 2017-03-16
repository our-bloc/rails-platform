class AddColumnsToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :design, :integer
    add_column :feedbacks, :job_quality, :integer
    add_column :feedbacks, :ease, :integer
    add_column :feedbacks, :login, :integer
  end
end
