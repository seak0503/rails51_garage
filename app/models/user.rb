class User < ApplicationRecord
  include Garage::Representer
  include Garage::Authorizable

  has_many :access_grants, class_name: "Doorkeeper::AccessGrant", foreign_key: :resource_owner_id, dependent: :delete_all
  has_many :access_tokens, class_name: "Doorkeeper::AccessToken", foreign_key: :resource_owner_id, dependent: :delete_all
  has_many :favorits
  has_many :books, through: :favorits

  property :id
  property :name
  property :email

  collection :books


  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write
  end
end
