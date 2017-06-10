class User < ApplicationRecord
  has_secure_password

  has_many :favourites, dependent: :destroy
  has_many :favourited_projects, through: :favourites, source: :project

  validates_uniqueness_of :email
end
