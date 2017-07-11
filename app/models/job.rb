class Job < ApplicationRecord
  belongs_to :user
  

   def self.search(search)
        Job.where('title LIKE :search OR decription OR industry OR gr LIKE :search', search: "%#{search}%")
    end
  
end
