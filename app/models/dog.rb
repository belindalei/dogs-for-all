class Dog < ApplicationRecord
  has_many :adoptions
  has_many :owners, through: :adoptions 

  validates :name, :age, presence: true  
end
