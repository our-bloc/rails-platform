class Job < ApplicationRecord
  belongs_to :user
    acts_as_votable

    def self.search(search)
        Job.where('title LIKE :search OR industry', search: "%#{search}%")
    end
        
    
    
  
end
