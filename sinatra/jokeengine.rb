class JokeEngine
   
  def initialize 
    request = Random.rand(2...13)
    offer = request + Random.rand(1...5)
    @joke = "Kommt ein Mann zum Bäcker und verlangt #{request} Brötchen. " + 
            "Da sagt der Bäcker: nehmen Sie doch #{offer}, " +
            "dann haben sie #{offer - request} mehr." 
  end
  
  def to_s 
    @joke
  end
  
  def to_speach
    "<speak><p>#{@joke}</p></speak>"
  end
  
end