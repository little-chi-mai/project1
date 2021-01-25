class User < ApplicationRecord
  has_many :rates
  has_many :likes
  has_many :comments
  has_many :recipes
  has_many :lists
end
