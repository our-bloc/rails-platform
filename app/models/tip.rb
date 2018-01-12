class Tip < ApplicationRecord
    belongs_to :user
    
    def self.search(search)
        Tip.where('title LIKE :search', search: "%#{search}%")
    end
    

end
