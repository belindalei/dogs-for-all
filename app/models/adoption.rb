class Adoption < ApplicationRecord
  belongs_to :owner
  belongs_to :dog
  belongs_to :cat

  validates :owner_id, :dog_id, presence: true
  validates_uniqueness_of :owner_id, scope: :dog_id, message: 'and dog have already been matched up.'
end
