require 'footrest/client'
module ArcApi
  class Client < Footrest::Client
    require 'arc_api/client/media'
    require 'arc_api/client/health_check'

    include Media
    include HealthCheck

    API_PATH = '/api/public/v1'.freeze
    MEDIA_PATH = '/media'.freeze
    UPLOADS_PATH = '/uploads'.freeze
    COMPLETE_PATH = '/complete'.freeze
    HEALTH_CHECK_PATH = '/ping'.freeze

    def set_connection(config)
      config[:logger] = config[:logging] if config[:logging]
      raise 'No client prefix url provided - must provide prefix' if config[:prefix].nil? || config[:prefix].empty?
      @connection = Faraday.new(url: config[:prefix]) do |faraday|
        faraday.use                         Footrest::FollowRedirects, limit: 5 unless config[:follow_redirects] == false
        faraday.use                         Footrest::ParseJson, content_type: /\bjson$/
        faraday.use                         Footrest::RaiseFootrestErrors
        faraday.use                         Footrest::Pagination
        faraday.request                     :multipart
        faraday.request                     :url_encoded
        faraday.adapter                     Faraday.default_adapter

        if config[:logger] == true
          faraday.response :logger
        elsif config[:logger]
          faraday.use Faraday::Response::Logger, config[:logger]
        end

        faraday.headers[:accept] = 'application/json'
        faraday.headers[:user_agent]      = 'Footrest'
        if config[:token] && config[:user_id]
          faraday.headers[:authorization] =  "Bearer user_id=\"#{config[:user_id]}\", token=\"#{config[:token]}\""
        else
          raise 'No api authorization provided - must provide token and user_id'
        end
      end
    end
  end

end
