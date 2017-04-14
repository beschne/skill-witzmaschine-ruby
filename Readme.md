# Witzmaschine

Alexa Custom Skill you may ask to tell you silly jokes. German language only. 

Developed as [Amazon Alexa Custom Skill](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-custom-skills)
using the [Sinatra](http://www.sinatrarb.com/) Ruby DSL
with Dan Elbert's [Alexa Skill Ruby](https://github.com/DanElbert/alexa_skills_ruby) gem. 
The Web Service will run on the [Heroku](https://www.heroku.com/) platform.
                                                           
## Development environment
                                                        
After cloning this repository you then need to install [Ruby](https://www.ruby-lang.org/), [rbenv](http://rbenv.org/) 
and [Bundler](http://bundler.io/) and than run Bundler on the Gemfile:

    $ rbenv local 2.2.0
    $ bundle install
    $ rbenv rehash

Test localy with [ngrok](https://ngrok.com/). Do not forget to adopt Alexa endpoint to ngrok changing forwarding address.

    $ rackup -p 3000
    $ ngrok http 3000 

## Production environment

The following environment variables need to be set:

* `RACK_ENV: production` (default for Heroku)
* `APPLICATION_ID`, the Amazon Skill Id   