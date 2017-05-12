# app/alexaskill.rb   

ENV['RACK_ENV'] ||= 'development'
  
require 'bundler' 
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra/base'
       
require_relative 'handler'

module Witzmaschine
  
  class AlexaSkill < Sinatra::Base
  
    set :root, File.dirname(__FILE__)

    enable :sessions, :static

    configure :development do
      enable :logging
    end 

    configure :test do   
      set :raise_errors, true
      set :show_exceptions, false
    end

    configure :production do
      enable  :logging
      disable :show_exceptions
    end
    
    post '/' do
      content_type :json
      handler = Handler.new(
        application_id: ENV['APPLICATION_ID'],
        skip_signature_validation: (Sinatra::Base.test? ? true : false), 
        logger: logger)
      begin
        headers = { 'Signature' => request.env['HTTP_SIGNATURE'], 
                    'SignatureCertChainUrl' => request.env['HTTP_SIGNATURECERTCHAINURL'] }  
        handler.handle(request.body.read, headers)
      rescue AlexaSkillsRuby::Error => e
        logger.error e.to_s
        403
      end
    end
     
    not_found do        
      404
    end
  
  end   
  
end