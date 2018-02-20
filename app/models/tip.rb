class Tip < ApplicationRecord
    belongs_to :user
    acts_as_votable
    
    def self.search(search)
        Tip.where('title LIKE :search', search: "%#{search}%")
    end
    

end
