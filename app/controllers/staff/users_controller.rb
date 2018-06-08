class Staff::UsersController < Staff::Base
  #include Garage::RestfulActions

  def index
    @users = User.all
  end
end
