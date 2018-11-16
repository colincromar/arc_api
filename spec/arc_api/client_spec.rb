require 'spec_helper'
describe ArcApi::Client do
  it 'sets the params' do
    client = ArcApi::Client.new(prefix: "http://canvas.instructure.com", token: "token", user_id: 5)
    expect(client.config[:prefix]).to eq("http://canvas.instructure.com")
    expect(client.config[:token]).to eq("token")
    expect(client.config[:user_id]).to eq(5)
  end
end
