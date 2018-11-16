require 'bundler/setup'
require 'arc_api'
require 'rspec'
require 'webmock/rspec'
require 'json'
require 'pry'

WebMock.disable_net_connect!

def fixture(*file)
  File.new(File.join(File.expand_path("../fixtures", __FILE__), *file))
end

def stub_get(client, url)
  stub_request(:get, "#{client.config[:prefix]}#{url}")
end

def stub_post(client, url)
  stub_request(:post, "#{client.config[:prefix]}#{url}")
end

def stub_put(client, url)
  stub_request(:put, "#{client.config[:prefix]}#{url}")
end

def stub_delete(client, url)
  stub_request(:delete, "#{client.config[:prefix]}#{url}")
end

def json_response(*file)
  {
    :body => fixture(*file),
    :headers => {
      :content_type => 'application/json; charset=utf-8'
    }
  }
end

def set_client
  @client = ArcApi::Client.new(prefix: "https://ccromar.instructuremedia.com",
                               token: "token", user_id: 5)
end
