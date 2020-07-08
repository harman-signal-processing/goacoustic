unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end
require 'acoustic'
require 'rspec'
require 'webmock/rspec'
require 'pry'

def stub_post(url)
  stub_request(:post, acoustic_url(url))
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def acoustic_url(url)
  "https://api-campaign-us-1.goacoustic.com#{url}"
end
