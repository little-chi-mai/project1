class Recipe < ApplicationRecord
  has_many :comments
  has_many :rates
  has_many :likes

  belongs_to :user, :optional => true
  belongs_to :country, :optional => true

  has_and_belongs_to_many :lists
  has_and_belongs_to_many :ingredients
end
