# spec/features/build-in_intents_spec.rb

require_relative '../spec_helper'

describe 'Build-in intents' do

  it 'AMAZON.CancelIntent should answer with a valid response' do
    request = load_sample_json('sample_AMAZON.CancelIntent.json')
    post '/', request   
    expect(last_response).to be_ok
    response = JSON.parse last_response.body     
    expect(response['version']).to eq '1.0' 
    expect(response['response']['shouldEndSession']).to eq true
    expect(response['response']['card']['type']).to eq 'Simple'
    expect(response['response']['card']['title']).to eq 'Witzmaschine'
    expect(response['response']['card']['content']).to include 'Auf wiederhören.'
    expect(response['response']['card']['content']).not_to include '<s>', '</s>'  
    expect(response['response']['outputSpeech']['type']).to eq 'SSML'
    expect(response['response']['outputSpeech']['ssml']).to include 'Auf wiederhören.'
    expect(response['response']['outputSpeech']['ssml']).to include '<speak>', '</speak>' 
    expect(response['response']['outputSpeech']['ssml']).to include '<s>', '</s>'
  end 

  it 'AMAZON.StopIntent should answer with a valid response' do
    request = load_sample_json('sample_AMAZON.StopIntent.json')
    post '/', request   
    expect(last_response).to be_ok
    response = JSON.parse last_response.body     
    expect(response['version']).to eq '1.0' 
    expect(response['response']['shouldEndSession']).to eq true
    expect(response['response']['card']['type']).to eq 'Simple'
    expect(response['response']['card']['title']).to eq 'Witzmaschine'
    expect(response['response']['card']['content']).to include 'Auf wiederhören.'
    expect(response['response']['card']['content']).not_to include '<s>', '</s>'  
    expect(response['response']['outputSpeech']['type']).to eq 'SSML'
    expect(response['response']['outputSpeech']['ssml']).to include 'Auf wiederhören.'
    expect(response['response']['outputSpeech']['ssml']).to include '<speak>', '</speak>' 
    expect(response['response']['outputSpeech']['ssml']).to include '<s>', '</s>'
  end
  
  it 'AMAZON.HelpIntent should answer with a valid response' do
    request = load_sample_json('sample_AMAZON.HelpIntent.json')
    post '/', request   
    expect(last_response).to be_ok
    response = JSON.parse last_response.body     
    expect(response['version']).to eq '1.0' 
    expect(response['response']['shouldEndSession']).to eq false
    expect(response['response']['card']['type']).to eq 'Simple'
    expect(response['response']['card']['title']).to eq 'Witzmaschine'
    expect(response['response']['card']['content']).to include 'Wie viele Brötchen dürfen es den sein?'
    expect(response['response']['card']['content']).not_to include '<s>', '</s>'  
    expect(response['response']['outputSpeech']['type']).to eq 'SSML'
    expect(response['response']['outputSpeech']['ssml']).to include 'Wie viele Brötchen dürfen es den sein?'
    expect(response['response']['outputSpeech']['ssml']).to include '<speak>', '</speak>' 
    expect(response['response']['outputSpeech']['ssml']).to include '<s>', '</s>'
  end 
   
  
end