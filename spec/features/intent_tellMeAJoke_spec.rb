# spec/features/intent_tellMeAJoke_spec.rb  
        
require_relative '../spec_helper'

describe 'Intent tellMeAJoke' do

  def issue_tellMeAJoke_request
    request = load_sample_json('sample_tellMeAJoke_request.json')
    post '/', request
  end                                             

  it 'should accept a valid Alexa tellMeAJoke request' do 
    issue_tellMeAJoke_request
    expect(last_response).to be_ok
  end                

  it 'should answer with a valid joke response' do
    issue_tellMeAJoke_request  
    expect(last_response).to be_ok 
    response = JSON.parse last_response.body
    expect(response['version']).to eq '1.0' 
    expect(response['response']['shouldEndSession']).to eq true
    expect(response['response']['card']['type']).to eq 'Simple'
    expect(response['response']['card']['title']).to eq 'Witzmaschine'
    expect(response['response']['card']['content']).to include 'Bäcker', 'Brötchen'
    expect(response['response']['outputSpeech']['type']).to eq 'SSML'
    expect(response['response']['outputSpeech']['ssml']).to include 'Bäcker', 'Brötchen'
    expect(response['response']['outputSpeech']['ssml']).to include '<speak>', '</speak>' 
    expect(response['response']['outputSpeech']['ssml']).to include '<s>', '</s>' 
  end

end