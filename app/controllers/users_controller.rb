class UsersController < ApplicationController
  #include Garage::RestfulActions

  def index
    @users = User.all
  end
end
