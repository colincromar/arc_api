module ArcApi
  class Client < Footrest::Client
    module HealthCheck
      def health_check
        @connection.headers['Accept'] = 'text/plain'
        get(API_PATH + HEALTH_CHECK_PATH)
      end
    end
  end
end
