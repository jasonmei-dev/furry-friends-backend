class FavoritedPet < ApplicationRecord
  has_many :lists
  has_many :users, through: :lists
end
