describe ArcApi::Client::HealthCheck do
  before { set_client }

  it 'returns pong' do
    stub_get(@client, '/health_check').to_return(json_response('health_check.json'))
  end
end
