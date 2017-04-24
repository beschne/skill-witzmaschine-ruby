# spec/features/intent_askForBuns_spec.rb  
        
require_relative '../spec_helper'

describe 'Intent askForBuns' do

  it 'should accept a valid Alexa askForBuns request' do  
    request = load_sample_json('sample_ask_for_12_buns_intent.json')
    post '/', request
    expect(last_response).to be_ok
  end                

  it 'should answer with a valid response' do
    request = load_sample_json('sample_ask_for_12_buns_intent.json')
    post '/', request   
    expect(last_response).to be_ok
    response = JSON.parse last_response.body     
    expect(response['version']).to eq '1.0' 
    expect(response['response']['shouldEndSession']).to eq true
    expect(response['response']['card']['type']).to eq 'Simple'
    expect(response['response']['card']['title']).to eq 'Witzmaschine'
    expect(response['response']['card']['content']).to include 'Nehmen Sie doch', 'Brötchen', 'dann haben Sie'
    expect(response['response']['card']['content']).not_to include '<s>', '</s>'  
    expect(response['response']['outputSpeech']['type']).to eq 'SSML'
    expect(response['response']['outputSpeech']['ssml']).to include 'Nehmen Sie doch', 'Brötchen', 'dann haben Sie'
    expect(response['response']['outputSpeech']['ssml']).to include '<speak>', '</speak>' 
    expect(response['response']['outputSpeech']['ssml']).to include '<s>', '</s>'
  end                                             
  
  it 'should handle a 0 buns request' do 
    request = load_sample_json('sample_ask_for_no_buns_intent.json')
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
  
  it 'should handle a too much buns request' do
    request = load_sample_json('sample_ask_for_2000_buns_intent.json')
    post '/', request         
    expect(last_response).to be_ok
    response = JSON.parse last_response.body     
    expect(response['version']).to eq '1.0' 
    expect(response['response']['shouldEndSession']).to eq false
    expect(response['response']['card']['type']).to eq 'Simple'
    expect(response['response']['card']['title']).to eq 'Witzmaschine'
    expect(response['response']['card']['content']).to include 'Es tut mir leid.' 
    expect(response['response']['card']['content']).to include 'Du kannst nicht mehr als'
    expect(response['response']['card']['content']).to include 'Versuche es doch noch einmal' 
    expect(response['response']['card']['content']).not_to include '<s>', '</s>'  
    expect(response['response']['outputSpeech']['type']).to eq 'SSML'
    expect(response['response']['outputSpeech']['ssml']).to include 'Es tut mir leid.'
    expect(response['response']['card']['content']).to include 'Es tut mir leid.' 
    expect(response['response']['card']['content']).to include 'Du kannst nicht mehr als'
    expect(response['response']['card']['content']).to include 'Versuche es doch noch einmal' 
    expect(response['response']['outputSpeech']['ssml']).to include '<speak>', '</speak>' 
    expect(response['response']['outputSpeech']['ssml']).to include '<s>', '</s>'
  end

  it 'should handle a no number of buns request' do
    request = load_sample_json('sample_ask_for_no_number_of_buns_intent.json')
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