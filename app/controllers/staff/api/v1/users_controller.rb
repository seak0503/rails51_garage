class Staff::Api::V1::UsersController < Staff::Api::Base
  include Garage::RestfulActions

  def require_resources
    @resources = User.all
  end

  def respond_with_resources_options
    { paginate: true }
  end
end