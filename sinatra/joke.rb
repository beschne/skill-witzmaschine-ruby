# joke.rb

class Joke
             
  TEXT_JOKE_TEMPLATE = \
    'Kommt ein Mann zum Bäcker und verlangt %d Brötchen. ' +
    'Da sagt der Bäcker: nehmen Sie doch %d, dann haben sie %d mehr.'
    
  SPEECH_JOKE_TEMPLATE = \
    '<s>Kommt ein Mann zum Bäcker und verlangt ' +
    '<say-as interpret-as="cardinal">%d</say-as> Brötchen.</s>' + 
    '<s>Da sagt der Bäcker: nehmen Sie doch ' +
    '<say-as interpret-as="cardinal">%d</say-as>' + 
    '<break time= "600ms"/>' +
    'dann haben sie <say-as interpret-as="cardinal">%d</say-as> mehr.</s>'
       
  attr_reader :text, :speech
  
  def initialize 
    request = Random.rand(2...13)
    offer = request + Random.rand(1...5)  
    @text   = sprintf(TEXT_JOKE_TEMPLATE,   request, offer, offer - request)
    @speech = sprintf(SPEECH_JOKE_TEMPLATE, request, offer, offer - request)
  end
   
end