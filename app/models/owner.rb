class Owner < ApplicationRecord
  has_many :adoptions
  has_many :dogs, through: :adoptions
  has_many :cats, through: :adoptions
  has_secure_password

  validates :name, presence: true, uniqueness: true
end
