module Doorkeeper
  module OAuth
    class ErrorResponse
      def body
        #status_code, error_code, error_type = case error.status
        #                          when :unauthorized
        #                            [401, 40100, "Unauthorized"]
        #                          when :forbidden
        #                            [403, 40300, "Forbidden"]
        #                          end
        {
          errors: [
            message: description,
            type: "Unauthorized",
            code: 40100,
            more_info: ""
          ]
        }
      end
    end
  end
end