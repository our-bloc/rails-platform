class Event < ApplicationRecord
    belongs_to :user
    has_many :rsvps
    has_many :users, through: :attendances
    
    mount_uploader :image, ImageUploader
    
    acts_as_votable
end
