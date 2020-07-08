require 'acoustic/client'

module Acoustic
  class << self
    # Alias for Acoustic::Client.new
    #
    # @return [Acoustic::Client]
    def new(options={})
      Acoustic::Client.new(options)
    end

    # Delegate to Acoustic::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end

