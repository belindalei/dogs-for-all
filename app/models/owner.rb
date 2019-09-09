class Owner < ApplicationRecord
  has_many :adoptions
  has_many :dogs, through: :adoptions

  validates :name, presence: true
end
