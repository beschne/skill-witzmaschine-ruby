# config.ru

require 'rubygems'
require 'bundler' 

require './sinatra/alexaskill'     

Bundler.require
 
$stdout.sync = true

run AlexaSkill