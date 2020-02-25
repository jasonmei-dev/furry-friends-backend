class User < ApplicationRecord
  has_secure_password

  has_one :list
  has_many :favorited_pets, through: :list
end
