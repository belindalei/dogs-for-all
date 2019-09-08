class Adoption < ApplicationRecord
  has_one :owner
  has_one :dog 
  belongs_to :owner
  belongs_to :dog
end
