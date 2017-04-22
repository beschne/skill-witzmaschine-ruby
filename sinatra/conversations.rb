# sinatra/conversations.rb

module Witzmaschine

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

end
