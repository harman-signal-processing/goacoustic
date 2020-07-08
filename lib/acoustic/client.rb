require 'builder'
require 'acoustic/connection'
require 'acoustic/request'
require 'client/contact'
require 'client/reporting'
require 'client/user'
require 'client/relational_table'

module Acoustic
  class Client
    def initialize(options={})
      @access_token = options[:access_token]
      @acoustic_url = options[:url]
    end

    include Acoustic::Connection
    include Acoustic::Request
    include Acoustic::Client::Contact
    include Acoustic::Client::Reporting
    include Acoustic::Client::User
    include Acoustic::Client::RelationalTable
  end
end
