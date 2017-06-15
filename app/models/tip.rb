class Tip < ApplicationRecord
    visitable 
    
    def self.search(search)
        Tip.where('title LIKE :search OR body LIKE :search', search: "%#{search}%")
    end
    
    def self.newline
        self.gsub(/\n/, '<br>')
    end
end
