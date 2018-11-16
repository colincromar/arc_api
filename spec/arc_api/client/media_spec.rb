describe ArcApi::Client::Media do
  before { set_client }

  it 'initiates a media upload' do
    resp = stub_post(@client, ('/media/uploads')).to_return(json_response('media_initiate_upload.json'))
    data = JSON.parse(resp.response.body)
    expect(data['upload']['id']).to eq(2890)
  end

  it 'creates a media object' do
    resp = stub_post(@client, ('/media')).to_return(json_response('media_create.json'))
    data = JSON.parse(resp.response.body)
    expect(data['media']['id']).to eq(2893)
    expect(data['media']['title']).to eq('Introduction to SAML')
  end

  it 'completes the media upload' do
    media_id = 2892
    resp = stub_post(@client, ("/media/uploads/#{media_id}/complete")).to_return(json_response('media_upload_completion.json'))
    data = JSON.parse(resp.response.body)
    expect(data['media']['id']).to eq(2892)
    expect(data['media']['title']).to eq('OAuth Overview')
    expect(data['media']['description']).to eq('A brief overview of how OAuth works')
  end
end
