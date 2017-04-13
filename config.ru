# config.ru

require 'rubygems'
require 'bundler' 
 
Bundler.require 

require './sinatra/alexaskill'     

# Heroku specific configuration 
$stdout.sync = true 
Signal.trap("TERM") { 
  puts 'SIGTERM caught, exiting'
  exit! 
}

run AlexaSkill