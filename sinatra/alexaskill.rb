# witzmaschine.rb   

require 'sinatra/base' 

require_relative 'handler'

class AlexaSkill < Sinatra::Base
  
  set :root, File.dirname(__FILE__)
  
  enable :sessions  
  
  configure :production, :development do
    enable :logging
  end
  
  post '/' do
    content_type :json
    handler = Handler.new(application_id: ENV['APPLICATION_ID'], logger: logger)
    begin
      headers = { 'Signature' => request.env['HTTP_SIGNATURE'], 
                  'SignatureCertChainUrl' => request.env['HTTP_SIGNATURECERTCHAINURL'] }
      handler.handle(request.body.read, headers)
    rescue AlexaSkillsRuby::Error => e
      logger.error e.to_s
      403
    end
  end
  
end