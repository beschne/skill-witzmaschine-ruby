# spec/spec_helper.rb 

ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'rspec' 
require 'json'
require 'multi_json'
require 'oj'
require 'rack/test'
require 'pp'

MultiJson.use :oj

Dir[File.expand_path('../support/**/*', __FILE__)].each { |f| require f }
 
require File.expand_path('../../sinatra/alexaskill', __FILE__)

RSpec.configure do |config|
  include Rack::Test::Methods
  config.include FixtureSupport
end  

def app
  Witzmaschine::AlexaSkill
end