class AddTyposToExperiences < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences , :typo , :string
    add_column :experiences , :typo_styled , :string
    add_column :experiences , :typo_metrics , :string
  end
end
