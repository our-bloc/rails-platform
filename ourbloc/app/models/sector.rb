class Sector < ApplicationRecord
  has_many :asks
  has_many :shares
  has_many :resources
end
