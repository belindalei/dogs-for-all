class Adoption < ApplicationRecord
  belongs_to :owner
  belongs_to :pet

  validates :owner_id, :pet_id, presence: true
  validates_uniqueness_of :owner_id, scope: :pet_id, message: 'and pet have already been matched.'
end
