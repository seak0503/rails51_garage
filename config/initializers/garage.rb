Garage.configure {}
Garage::TokenScope.configure do
  register :public, desc: 'accessing publicly available data' do
    access :read, User
#    access :read, Post
    access :write, User
#    access :write, Post
  end
end

Garage.configuration.strategy = Garage::Strategy::Doorkeeper
Doorkeeper.configure do
  orm :active_record
  default_scopes :public
  optional_scopes(*Garage::TokenScope.optional_scopes)

  resource_owner_from_credentials do |routes|
    User.find_by(email: params[:username])
  end

  client_credentials :from_basic, :from_params

  access_token_expires_in 1.minutes
  use_refresh_token
end

Doorkeeper.configuration.token_grant_types << "password"