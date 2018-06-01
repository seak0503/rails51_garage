class Favorit < ApplicationRecord
  include Garage::Representer
  include Garage::Authorizable

  belongs_to :user
  belongs_to :book

  property :user_id
  property :book_id
  property :favorit

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write
  end
end
