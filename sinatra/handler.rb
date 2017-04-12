# handler.rb     

require 'alexa_skills_ruby'

require_relative 'jokeengine'

class Handler < AlexaSkillsRuby::Handler 
                         
  on_intent('tellMeAJoke') do  
    joke = JokeEngine.new
    slots = request.intent.slots
    response.set_output_speech_text(joke.to_s)
    response.set_output_speech_ssml(joke.to_speach)
    response.set_reprompt_speech_text("Noch ein Witz?")
    response.set_reprompt_speech_ssml("<speak>Noch ein Witz?</speak>")
    response.set_simple_card("title", "content")
    logger.info 'tellMeAJoke processed'
  end
  
end
