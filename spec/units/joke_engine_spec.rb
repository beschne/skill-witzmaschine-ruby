# spec/units/joke_engine_spec.rb

require_relative '../spec_helper'

describe Witzmaschine::JokeEngine do
  
  ITERATIONS = 50
      
  def validate_joke(joke)
    expect(joke.request).to be_between(Witzmaschine::MIN_BUNS, Witzmaschine::MAX_BUNS).inclusive
    expect(joke.offer).to   be_between(Witzmaschine::MIN_BUNS, Witzmaschine::MAX_BUNS).inclusive
    expect(joke.difference).to be_between(1, Witzmaschine::MAX_DIFF_BUNS).inclusive
  end
  
  it 'includes valid joke attributes' do 
    joke = Witzmaschine::JokeEngine.new
    expect(joke).to respond_to :request
    expect(joke).to respond_to :offer 
    expect(joke).to respond_to :difference
    expect(joke).to respond_to :more_or_less
  end
  
  it "should create valid joke data with no input, #{ITERATIONS} iterations" do
    for i in 1..20 do
      joke = Witzmaschine::JokeEngine.new rand(Witzmaschine::MIN_BUNS..Witzmaschine::MAX_BUNS)
      validate_joke joke
    end
  end
  
  it "should create valid joke data with input data, #{ITERATIONS} iterations" do 
    for i in 1..20 do
      joke = Witzmaschine::JokeEngine.new rand(Witzmaschine::MIN_BUNS..Witzmaschine::MAX_BUNS)
      validate_joke joke
    end
  end

  it 'should create valid joke data with invalid input data' do
    joke = Witzmaschine::JokeEngine.new Witzmaschine::MAX_BUNS * 10
    validate_joke joke 
    joke = Witzmaschine::JokeEngine.new Witzmaschine::MIN_BUNS - Witzmaschine::MAX_BUNS
    validate_joke joke
  end 


end
