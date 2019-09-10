class Cat < ApplicationRecord
  has_many :adoptions
  has_many :owners, through: :adoptions 

  validates :name, :age, :gender, presence: true  
end
