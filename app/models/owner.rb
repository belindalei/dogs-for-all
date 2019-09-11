class Owner < ApplicationRecord
  has_many :adoptions
  has_many :pets, through: :adoptions
  has_secure_password

  validates :name, :username, presence: true, uniqueness: true
end
