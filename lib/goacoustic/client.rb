require 'builder'
require 'goacoustic/connection'
require 'goacoustic/request'
require 'client/contact'
require 'client/reporting'
require 'client/user'
require 'client/relational_table'

module GoAcoustic
  class Client
    def initialize(options={})
      @access_token = options[:access_token]
      @goacoustic_url = options[:url]
    end

    include GoAcoustic::Connection
    include GoAcoustic::Request
    include GoAcoustic::Client::Contact
    include GoAcoustic::Client::Reporting
    include GoAcoustic::Client::User
    include GoAcoustic::Client::RelationalTable
  end
end
