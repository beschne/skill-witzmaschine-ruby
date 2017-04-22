# spec/units/joke

require_relative '../spec_helper'

describe Joke do 
  
  subject (:joke) { Joke.new }  

  it 'includes valid joke text' do 
    expect(joke).to respond_to(:text)
    expect(joke.text).to be_a(String)
    expect(joke.text).to include 'Kommt ein Mann zum Bäcker', 'Brötchen', 'mehr' 
    expect(joke.text).not_to include '<s>', '</s>'      
  end     
  
  it 'includes valid joke speech' do 
    expect(joke).to respond_to(:speech)
    expect(joke.speech).to be_a(String)
    expect(joke.speech).to include 'Kommt ein Mann zum Bäcker', 'Brötchen', 'mehr' 
    expect(joke.speech).to include '<s>', '</s>'
  end 
  
end