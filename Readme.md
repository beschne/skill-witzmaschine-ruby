# Witzmaschine

Alexa Skill you may ask to tell you a joke. In German only. 

Developed as [Amazon Alexa Custom Skill](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-custom-skills)
using the Ruby [Sinatra](http://www.sinatrarb.com/) framework to be deployed on [Heroku](https://www.heroku.com/).
                                                           
## Development environment

Test with [ngrok](https://ngrok.com/). Do not forget to adopt Alexa endpoint to ngrok changing forwarding address.
```
rackup -p 3000
ngrok http 3000
```