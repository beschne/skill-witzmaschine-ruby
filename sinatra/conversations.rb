# sinatra/conversations.rb

module Witzmaschine

  INTRO_SPEECH = \
    '<s>Du kommst zum Bäcker.</s>' +
    '<s>Er fragt: wie viele Brötchen hätten Sie den gerne?</s>'

  ANSWER_TEXT_TEMPLATE = \
    'Nehmen Sie doch %d Brötchen, dann haben Sie %d %s.' 
    
  ANSWER_SPEECH_TEMPLATE = \
    '<s>Nehmen Sie doch ' +
    '<say-as interpret-as="cardinal">%d</say-as> Brötchen' +
    '<break time= "600ms"/>' +
    'dann haben Sie <say-as interpret-as="cardinal">%d</say-as> %s.</s>'

  FULL_JOKE_TEXT_TEMPLATE = \
    'Kommt ein Mann zum Bäcker und verlangt %d Brötchen. ' +
    'Da sagt der Bäcker: nehmen Sie doch %d, dann haben sie %d %s.'

  FULL_JOKE_SPEECH_TEMPLATE = \
    '<s>Kommt ein Mann zum Bäcker und verlangt ' +
    '<say-as interpret-as="cardinal">%d</say-as> Brötchen.</s>' + 
    '<s>Da sagt der Bäcker: nehmen Sie doch ' +
    '<say-as interpret-as="cardinal">%d</say-as>' + 
    '<break time= "600ms"/>' +
    'dann haben sie <say-as interpret-as="cardinal">%d</say-as> %s.</s>'

  TOO_MUCH_BUNS_TEXT_TEMPLATE = \
    'Es tut mir leid. Du kannst nicht mehr als %d Brötchen haben. Versuche es doch noch einmal.'
   
  TOO_MUCH_BUNS_SPEECH_TEMPLATE = \
    '<s>Es tut mir leid.</s>' +
    '<s>Du kannst nicht mehr als %d Brötchen haben.</s>' +
    '<s>Versuche es doch noch einmal.</s>'

   HELP_TEXT = 
     'Wie viele Brötchen dürfen es den sein?'

   HELP_SPEECH =
     '<s>Wie viele Brötchen dürfen es den sein?</s>'

end
