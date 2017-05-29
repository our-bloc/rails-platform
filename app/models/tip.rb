class Tip < ApplicationRecord
    
    def self.search(search)
        Tip.where('title LIKE :search OR body LIKE :search', search: "%#{search}%")
    end
end
