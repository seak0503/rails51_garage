class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #include Garage::ControllerHelper

  def current_resource_owner
    @current_resource_owner ||= User.find(resource_owner_id) if resource_owner_id
  end

  def doorkeeper_unauthorized_render_options(error: nil)
    status_code, error_code, error_type = case error.status
                              when :unauthorized
                                [401, 40100, "Unauthorized"]
                              when :forbidden
                                [403, 40300, "Forbidden"]
                              end

    {
      json: {
        errors: [
          {
            message: error.description,
            type: error_type,
            code: error_code,
            more_info: "",
          }
        ]
      },
      status: status_code
    }
  end

  private
  def current_user
    if session[:current_user_id]
      @current_account ||= User.find(session[:current_user_id])
    end
  end

  helper_method :current_user
end
