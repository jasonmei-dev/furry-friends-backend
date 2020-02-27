class User < ApplicationRecord
  has_secure_password

  has_many :lists
  has_many :favorited_pets, through: :lists
end
