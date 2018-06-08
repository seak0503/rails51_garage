class Staff::ApiApplicationsController < Doorkeeper::ApplicationsController
  include Staff::SessionManager
  before_action :authorize_check
end