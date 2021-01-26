class User < ApplicationRecord
  has_many :rates
  has_many :likes
  has_many :comments
  has_many :recipes
  has_many :lists
  has_secure_password
  validates :email, :uniqueness => true, :presence => true
end
