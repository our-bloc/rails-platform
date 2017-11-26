class Job < ApplicationRecord
  belongs_to :user
  

    def self.search(search)
        Job.where('title LIKE :search OR industry', search: "%#{search}%")
    end
        
    
    
  
end
