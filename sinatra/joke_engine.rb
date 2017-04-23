# sinatra/jokeengine.rb

module Witzmaschine

  MIN_BUNS  = 1
  MAX_BUNS  = 40
  MAX_DIFF_BUNS = 3
  
  class JokeEngine
    
    attr_reader :request, :offer, :difference, :more_or_less
    
    def initialize request = 0  
      # calculate requested number of buns
      if (request == 0)
        @request = Random.rand(MIN_BUNS..MAX_BUNS)
      else
        @request = request
      end
      # normalize request to make class robust
      @request = MAX_BUNS if @request > MAX_BUNS
      @request = MIN_BUNS if @request < MIN_BUNS
      # calculate different offering
      min = @request - MAX_DIFF_BUNS < MIN_BUNS ? MIN_BUNS : @request - MAX_DIFF_BUNS
      max = @request + MAX_DIFF_BUNS > MAX_BUNS ? MAX_BUNS : @request + MAX_DIFF_BUNS
      @offer = ([*min..max] - [@request]).sample
      # calculate difference text
      @difference = @offer - @request
      @more_or_less = @difference < 0 ? "weniger" : "mehr"
      # normalize difference
      @difference = @difference.abs
    end 
    
    def full_joke_text
      sprintf(FULL_JOKE_TEXT_TEMPLATE, @request, @offer, @difference, @more_or_less)
    end
    
    def full_joke_speech
      sprintf(FULL_JOKE_SPEECH_TEMPLATE, @request, @offer, @difference, @more_or_less)
    end
    
    def answer_text
      sprintf(ANSWER_SPEECH_TEMPLATE, @offer, @difference, @more_or_less)
    end
    
    def answer_speech
      sprintf(ANSWER_SPEECH_TEMPLATE, @offer, @difference, @more_or_less)
    end
    
  end
  
end