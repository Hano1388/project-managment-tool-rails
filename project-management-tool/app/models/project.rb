class Project < ApplicationRecord

  has_many :favourites, dependent: :destroy
  has_many :favers, through: :favourites, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates(:title, presence: {message: 'must be provided'}, uniqueness: true)
end
