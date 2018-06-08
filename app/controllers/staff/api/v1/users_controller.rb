class Staff::Api::V1::UsersController < Staff::Api::Base
  include Garage::RestfulActions

  def require_resources
    @resources = User.all
  end
end