class AddMoreTyposToExperiences < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences , :typo_title , :string
    add_column :experiences , :typo_position , :string
    add_column :experiences , :typo_detail2 , :string
    add_column :experiences , :typo_detail3 , :string
    add_column :experiences , :typo_detail4 , :string




  end
end
