class User < ApplicationRecord
  include Garage::Representer
  include Garage::Authorizable

  has_many :favorits
  has_many :books, through: :favorits

  property :id
  property :name
  property :email

  collection :favorits


  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write
  end
end
