class Staff::Base < ApplicationController
  include Staff::SessionManager
  before_action :authorize_check
  helper_method :current_staff
end