class Dog < ApplicationRecord
  has_many :adoptions
  has_many :owners, through: :adoption 
end
