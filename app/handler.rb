# app/handler.rb

require 'alexa_skills_ruby'

require_relative 'conversations'
require_relative 'joke_engine'
 
module Witzmaschine
  
  class Handler < AlexaSkillsRuby::Handler 

    on_launch() do  
      speech = Witzmaschine::INTRO_SPEECH
      response.set_output_speech_ssml('<speak>' + speech + '</speak>')
      response.set_reprompt_speech_ssml('<speak><s>Ich wiederhole:</s>' + speech + '</speak>')
      response.should_end_session = false
      logger.info 'on_launch processed'  
    end
 
    on_intent('askForBuns') do
      number = request.intent.slots['number']
      if (number != nil)
        if number == '?'
          set_response(HELP_TEXT, HELP_SPEECH, false)
          logger.info 'askForBuns (no number) processed'
        else 
          request = number.to_i
          if request == 0
            set_response(HELP_TEXT, HELP_SPEECH, false)
          elsif request > MAX_BUNS           
            text   = sprintf(TOO_MUCH_BUNS_TEXT_TEMPLATE,   MAX_BUNS)
            speech = sprintf(TOO_MUCH_BUNS_SPEECH_TEMPLATE, MAX_BUNS)
            set_response(text, speech, false)
          else
            joke = JokeEngine.new request
            set_response(joke.answer_text, joke.answer_speech, true)
          end
          logger.info "askForBuns (#{request}) processed"
        end
      end
    end

    on_intent('tellMeAJoke') do
      joke = JokeEngine.new  
      set_response(joke.full_joke_text, joke.full_joke_speech, true)
      logger.info "tellMeAJoke (r#{joke.request},o#{joke.offer}) processed"
    end     
    
    on_intent('AMAZON.CancelIntent') do
      set_response(GOODBYE_TEXT, GOODBYE_SPEECH, true)
      logger.info 'AMAZON.CancelIntent processed'
    end
      
    on_intent('AMAZON.StopIntent') do 
      set_response(GOODBYE_TEXT, GOODBYE_SPEECH, true)
      logger.info 'AMAZON.StopIntent processed'
    end
    
    on_intent('AMAZON.HelpIntent') do
      set_response(HELP_TEXT, HELP_SPEECH, false)
      logger.info 'AMAZON.HelpIntent processed'
    end
    
    def set_response text, speech, session_end
      response.set_output_speech_text(text)
      response.set_output_speech_ssml('<speak>' + speech + '</speak>')
      response.set_reprompt_speech_text(text)
      response.set_reprompt_speech_ssml('<speak><s>Ich wiederhole:</s>' + speech + '</speak>')
      response.set_simple_card('Witzmaschine', text) 
      response.should_end_session = session_end
    end  
    
  end

end
