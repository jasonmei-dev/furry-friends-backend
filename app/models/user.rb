class User < ApplicationRecord
  has_secure_password

  has_many :likes
  has_many :pets, through: :likes
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :postcode, presence: true
end
