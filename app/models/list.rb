class List < ApplicationRecord
  belongs_to :user
  belongs_to :favorited_pet
end
