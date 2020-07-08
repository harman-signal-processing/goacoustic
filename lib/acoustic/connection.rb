require 'faraday_middleware'

module Acoustic
  # @private
  module Connection
    private

    def connection(options={})
      connection = Faraday.new @acoustic_url do |conn|
        # Uncomment if want to log to stdout
        #conn.response :logger

        conn.request :oauth2, @access_token, token_type: :bearer
        conn.request :url_encoded
        conn.response :mashify

        conn.response :xml, :content_type => /\bxml$/
        conn.adapter Faraday.default_adapter
      end
      connection
    end
  end
end
