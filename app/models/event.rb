class Event < ApplicationRecord
    belongs_to :user
    has_many :rsvps
    has_many :users, through: :attendances
end
