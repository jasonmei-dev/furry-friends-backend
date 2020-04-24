class Pet < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes

  serialize :breeds
  serialize :photos
  serialize :contact
  serialize :primary_photo_cropped
end
