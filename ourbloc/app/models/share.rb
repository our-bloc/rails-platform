class Share < ApplicationRecord
  belongs_to :user
  belongs_to :sector
end
