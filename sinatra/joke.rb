# joke.rb                           

require_relative 'conversations'

module Witzmaschine

  class Joke
             
    attr_reader :text, :speech

    def initialize 
      request = Random.rand(2...13)
      offer = request + Random.rand(1...5)  
      @text   = sprintf(Witzmaschine::TEXT_JOKE_TEMPLATE,   request, offer, offer - request)
      @speech = sprintf(Witzmaschine::SPEECH_JOKE_TEMPLATE, request, offer, offer - request)
    end

  end 

end