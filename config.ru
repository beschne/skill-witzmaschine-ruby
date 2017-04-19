# config.ru

require 'rubygems'
require 'bundler' 
Bundler.require 

$stdout.sync = true 

require './sinatra/alexaskill'     
run AlexaSkill