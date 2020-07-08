require 'goacoustic/client'

module GoAcoustic
  class << self
    # Alias for GoAcoustic::Client.new
    #
    # @return [GoAcoustic::Client]
    def new(options={})
      GoAcoustic::Client.new(options)
    end

    # Delegate to GoAcoustic::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end

