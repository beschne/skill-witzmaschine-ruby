# handler.rb     

require 'alexa_skills_ruby'

require_relative 'joke'

class Handler < AlexaSkillsRuby::Handler 

  on_launch() do 
    createJoke
    logger.info 'on_launch processed'  
  end
  
  on_intent('tellMeAJoke') do  
    createJoke
    logger.info 'tellMeAJoke processed'
  end
   
  def createJoke 
    joke = Joke.new
    response.set_output_speech_text(joke.text)
    response.set_output_speech_ssml('<speak>' + joke.speech + '</speak>')
    response.set_reprompt_speech_text(joke.text)
    response.set_reprompt_speech_ssml('<speak><s>Ich wiederhole:</s>' + joke.speech + '</speak>')
    response.set_simple_card('Witzmaschine', joke.text) 
    response.should_end_session = true
  end
  
end
