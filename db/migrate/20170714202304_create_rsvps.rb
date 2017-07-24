class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.string :school
      t.string :gradyear
      t.string :gradschool
      t.string :major
      t.string :style
      t.string :prep
      t.string :dreamjob
      t.string :breakout
      t.string :breakout2
      t.string :resume
      t.string :promo_code
      t.string :group
      t.string :access
      t.string :food
      t.string :pronouns

      t.timestamps
    end
  end
end
