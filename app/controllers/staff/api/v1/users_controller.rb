class Staff::Api::V1::UsersController < Staff::Api::Base
  include Garage::RestfulActions

  def require_resources
    @resources = User.all
  end

  def require_resource
    @resource = User.find(params[:id])
  end

  def create_resource
    @resource = @resources.new(user_params)
    @resource.save!
    @resource
  end

  def update_resource
    @resource.update!(user_params)
    @resource
  end

  def user_params
    params.permit(:name, :email, :password)
  end

  def respond_with_resources_options
    { paginate: true }
  end

  def respond_with_resource_options
    { patch: { body: true } }
  end
end