class Pet < ApplicationRecord
    has_many :adoptions
    has_many :owners, through: :adoptions 

    validates :name, :age, :gender, presence: true  

 
    def self.filter(filter)
        if filter
            # byebug
            if filter["pet_id"] == "No Owner" && filter["pet_id"] != ""
                self.all.select do |pet| 
                    pet.adoptions.count == 0
                end
            elsif filter["pet_id"] == "Has Owner" && filter["pet_id"] != ""
                self.all.select do |pet| 
                    pet.adoptions.count > 0
                end
            else
                Pet.all
            end
        else
            Pet.all
        end
    end
end
