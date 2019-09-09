class Adoption < ApplicationRecord
  belongs_to :owner
  belongs_to :dog

  validates :owner_id, :dog_id, presence: true, uniqueness: true
end
