class Staff::Api::Base < ApplicationController
  protect_from_forgery with: :null_session

  include Garage::ControllerHelper

  def current_resource_owner
    @current_resource_owner = nil
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
end