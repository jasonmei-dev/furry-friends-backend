class Pet < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes

  serialize :breeds, Hash
  serialize :photos, Array
  serialize :contact, Hash
end
