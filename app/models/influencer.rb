class Influencer < ApplicationRecord
     belongs_to :user
     mount_uploader :image, ImageUploader
     acts_as_votable
     
     def self.search(search)
        # where(:title, query) -> This would return an exact match of the query
        Tip.where('name LIKE :search OR industry LIKE :search or description LIKE :search or grad LIKE :search or resources LIKE :search or advice1 LIKE :search or advice2 LIKE :search', search: "%#{search}%")

     end
end
