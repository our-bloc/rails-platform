class Influencer < ApplicationRecord
     def self.search(search)
        # where(:title, query) -> This would return an exact match of the query
        Tip.where('name LIKE :search OR industry LIKE :search or description LIKE :search ', search: "%#{search}%")

     end
end
